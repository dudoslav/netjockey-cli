module Netjockey
  module Entities
    # Class for storing RoomInfo entity
    RoomInfo = Struct.new(:name, :id) do
      def self.from_hash(room_info_hash)
        check_hash!(room_info_hash)
        room_info = RoomInfo.new
        room_info.name = room_info_hash['name']
        room_info.id = room_info_hash['id']
        room_info
      end

      def self.check_hash!(room_info_hash)
        raise Errors::InvalidEntityHashError \
          unless %w(name id).all? { |k| room_info_hash.key? k }
      end
    end
  end
end
