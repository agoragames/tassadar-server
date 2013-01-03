require 'rack/throttle'

module Tassadar
  module Server
    class Throttle < Rack::Throttle::Hourly

      def client_identifier(request)
        # Determine whether the user should be identified by a unique
        # header (for example, a username or token), or simply by IP
        # for the purpose of rate limiting.
        if ENV['USER_HEADER'] && request.env.has_key?(ENV['USER_HEADER'])
          request.env[ENV['USER_HEADER']].to_s
        else
          request.ip.to_s
        end
      end

      # Patch for unmerged https://github.com/datagraph/rack-throttle/pull/6
      def http_error(code, message = nil, headers = {})
        [ code,
          { 'Content-Type' => 'text/plain; charset=utf-8' }.merge(headers),
          Array( http_status(code) + (message.nil? ? "\n" : " (#{message})\n") )
        ]
      end
      
    end
  end
end
