require 'netjockey'

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

  describe '.create_room' do
    context 'with valid room' do
      let(:room_hash) do
        { 'roomInfo' => { 'name' => 'test', 'id' => '322' },
          'currentSongTime' => '420',
          'queue' => { 'playlist' => [] } }
      end

      it 'should create room from room hash' do
        room = service.send(:create_room, room_hash)
        expect(room).to be_instance_of Netjockey::Entities::Room
        expect(room.room_info).to be_instance_of Netjockey::Entities::RoomInfo
        expect(room.room_info.name).to eq('test')
        expect(room.room_info.id).to eq('322')
        expect(room.current_song_time).to eq('420')
        expect(room.song_queue).to be_instance_of Array
        expect(room.song_queue).to be_empty
      end
    end

    context 'with invalid room' do
      let(:room_hash) {}

      it 'should raise error' do
        expect(service.send(:create_room, room_hash)).to raise_error
      end
    end
  end

  describe '.create_songs' do
    context 'with valid songs' do
      let(:songs_hash) do
        [{ 'duration' => '69',
           'title' => 'rhapsody',
           'id' => '123',
           'thumbnailUrl' => 'localhost',
           'uuid' => '1231354' },
         { 'duration' => '70',
           'title' => 'queen',
           'id' => '124',
           'thumbnailUrl' => 'remotehost',
           'uuid' => '4321100' }]
      end

      it 'should create array of songs from songs hash' do
        songs = service.send(:create_songs, songs_hash)
        expect(songs).to be_instance_of Array
        expect(songs.length).to eq(2)
        expect(songs[0].title).to eq('rhapsody')
        expect(songs[1].title).to eq('queen')
      end
    end
  end
end
