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
    end
  end
end
