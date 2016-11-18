module Netjockey
  module Entities
    # Class for storing Room entity
    Room = Struct.new(:room_info,
                      :current_song_time,
                      :song_queue) do
      def self.from_hash(room_hash)
        check_hash!(room_hash)
        room = Room.new
        room.current_song_time = room_hash['currentSongTime']
        room.room_info = RoomInfo.from_hash(room_hash['roomInfo'])
        room.song_queue = SongQueue.from_hash(room_hash['queue'])
        room
      end

      def self.check_hash!(room_hash)
        raise Errors::InvalidEntityHashError, 'room hash is invalid' \
          unless %w(roomInfo
                    currentSongTime
                    queue).all? { |k| room_hash.key? k }
      end
    end
  end
end
