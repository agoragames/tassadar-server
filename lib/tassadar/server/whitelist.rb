module Tassadar
  module Server
    class Whitelist
      def initialize(app, addresses)
        @app = app
        @whitelist = addresses
      end

      def call(env)
        if white_listed?(env)
          @app.call(env)
        else
          [ 403,
            { 'Content-Type' => 'text/plain; charset=utf-8' },
            Array( 'IP is not whitelisted' )
          ]
        end
      end
      
      def white_listed?(env)
        @whitelist.include? env['REMOTE_ADDR']
      end
    end
  end
end
