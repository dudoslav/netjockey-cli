require 'spec_helper'

describe Netjockey::Entities::RoomInfo do
  describe '#check_hash!' do
    context 'with valid hash' do
      let(:room_info_hash) { { 'name' => 'rumka', 'id' => '8' } }

      it 'should not raise error' do
        expect { Netjockey::Entities::RoomInfo.check_hash!(room_info_hash) }
          .not_to raise_error
      end
    end

    context 'with invalid hash' do
      let(:room_info_hash) { { 'something' => 'ulu', 'id' => '8', 'usl' => '12' } }

      it 'should raise error' do
        expect { Netjockey::Entities::RoomInfo.check_hash!(room_info_hash) }
          .to raise_error(Netjockey::Errors::InvalidEntityHashError)
      end
    end
  end

  describe '#from_hash' do
    context 'with valid hash' do
      let(:room_info_hash) { { 'name' => 'rumka', 'id' => '8' } }

      it 'creates RoomInfo from hash' do
        room_info = Netjockey::Entities::RoomInfo.from_hash(room_info_hash)
        expect(room_info).to be_instance_of Netjockey::Entities::RoomInfo
        expect(room_info.name).to eq('rumka')
        expect(room_info.id).to eq('8')
      end
    end
  end
end
