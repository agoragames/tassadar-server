require 'spec_helper'

describe Tassadar::Server::API do
  include Rack::Test::Methods

  def app
    Rack::Builder.parse_file('config.ru').first
  end

  describe 'POST /sc2/replay' do
    let(:valid_replay) {
      File.join(
        File.dirname(__FILE__), 'replays', 'delta_quadrant.SC2Replay'
      )
    }

    let(:valid_replay_json) {
      File.join(
        File.dirname(__FILE__), 'replays', 'delta_quadrant.json'
      )
    }

    context 'with no file' do
      before { post '/sc2/replay' }
      subject { last_response }
      its(:status) { should eql 500 }
    end

    context 'with a valid file' do
      before do
        post '/sc2/replay', :file => Rack::Test::UploadedFile.new(
          valid_replay, 'mime/type'
        )
      end
      subject { last_response }
      its(:status) { should eql 201 }

      describe 'body' do
        subject { last_response.body }
        it 'should match the expected json' do
          should be_json_eql File.read(valid_replay_json)
        end
      end

    end
  end
end
