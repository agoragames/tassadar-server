module Tassadar
  module Server
    class API < ::Grape::API
      version 'v1', :using => :header, :vendor => 'agoragames'
      format :json
      formatter :json, Grape::Formatter::Rabl
      content_type :json, 'application/json'

      helpers do
        def get_file
          unless params[:file] &&
                (tmpfile = params[:file][:tempfile]) &&
                (name = params[:file][:filename])
            error! 'No file uploaded', 500
          end
          tmpfile
        end

        def parse(path)
          Tassadar::SC2::Replay.new(path)
        end
      end

      resource :sc2 do
        desc 'Return parsed output for an uploaded replay'
        post :replay, rabl: 'replay' do
          @replay = parse(get_file)
        end
      end
    end
  end
end
