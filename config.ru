$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'tassadar-server'

use Rack::Config do |env|
  env['api.tilt.root'] = File.join(
    File.dirname(__FILE__), 'lib', 'tassadar', 'server', 'views'
  )
end

run Tassadar::Server::API
