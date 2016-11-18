require 'spec_helper'

describe Netjockey::Entities::Song do
  describe '#check_hash!' do
    context 'with valid hash' do
      let(:song_hash) { { 'duration' => '5', 'title' => 'asdfmovie', 'id' => '1', 'thumbnailUrl' => 'www.lol.ru', 'uuid' => '3' } }

      it 'should not raise error' do
        expect { Netjockey::Entities::Song.check_hash!(song_hash) }
          .not_to raise_error
      end
    end

    context 'with valid hash' do
      let(:song_hash) { { 'id' => '1', 'thumbnailUrl' => 'www.lol.ru', 'uuid' => '3' } }

      it 'should raise error' do
        expect { Netjockey::Entities::Song.check_hash!(song_hash) }
          .to raise_error(Netjockey::Errors::InvalidEntityHashError)
      end
    end
  end

  describe '#from_hash' do
    context 'with valid hash' do
      let(:song_hash) { { 'duration' => '5', 'title' => 'asdfmovie', 'id' => '1', 'thumbnailUrl' => 'www.lol.ru', 'uuid' => '3' } }

      it 'creates Song from hash' do
        song = Netjockey::Entities::Song.from_hash(song_hash)
        expect(song).to be_instance_of Netjockey::Entities::Song
        expect(song.duration).to eq('5')
        expect(song.title).to eq('asdfmovie')
        expect(song.id).to eq('1')
        expect(song.thumbnail_url).to eq('www.lol.ru')
        expect(song.uuid).to eq('3')
      end
    end
  end
end
