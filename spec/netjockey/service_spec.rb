require 'spec_helper'

describe Netjockey::Service do
  subject(:service) { Netjockey::Service.new }

  describe '#new' do
    it 'returns instance of Service' do
      is_expected.to be_instance_of Netjockey::Service
    end

    it 'prepares url as string' do
      expect(service.instance_variable_get(:@url)).to be_instance_of String
      expect(service.instance_variable_get(:@url)).not_to be_empty
    end

    it 'prepares url as string from argument' do
      custom_service = Netjockey::Service.new('test.ru')
      expect(custom_service.instance_variable_get(:@url)).to be_instance_of String
      expect(custom_service.instance_variable_get(:@url)).to eq('test.ru')
    end
  end

  describe '.rooms' do
    context 'with valid response' do
      before do
        response = '{"rooms":[{"name":"jeden","id":"1"},{"name":"dva","id":"2"},{"name":"tri","id":"3"}]}'
        stub_request(:get, %r{dudj-jasbar\.rhcloud\.com\/v1\/rooms})
          .to_return(body: response, status: 200)
      end

      it 'should fetch rooms' do
        rooms = service.rooms
        expect(rooms).to be_instance_of Array
        expect(rooms.size).to eq(3)
        expect(rooms[0]).to be_instance_of Netjockey::Entities::RoomInfo
        expect(rooms[1]).to be_instance_of Netjockey::Entities::RoomInfo
        expect(rooms[2]).to be_instance_of Netjockey::Entities::RoomInfo
      end
    end
  end

  describe '.room' do
    context 'with valid response' do
      before do
        response = '{"roomInfo":{"name":"rumka","id":"41"},"currentSongTime":"42","queue":{"playlist":[]}}'
        stub_request(:get, %r{dudj-jasbar\.rhcloud\.com\/v1\/room\/41})
          .to_return(body: response, status: 200)
      end

      it 'should fetch room' do
        room = service.room(41)
        expect(room).to be_instance_of Netjockey::Entities::Room
      end
    end

    context 'with not found response' do
      before do
        stub_request(:get, %r{dudj-jasbar\.rhcloud\.com\/v1\/room\/41})
          .to_return(status: 404)
      end

      it 'should raise error' do
        expect { service.room(41) }.to raise_error(Netjockey::Errors::EntityNotFoundError)
      end
    end
  end
end
