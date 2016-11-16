module Netjockey
  module Entities
    # Class for storing Room entity
    class Room < Struct.new(:room_info,
                      :current_song_time,
                      :song_queue)
      def self.from_hash(room_hash)
        check_hash!(room_hash)
        room = Room.new
        room.current_song_time = room_hash['current_song_time']
        room.room_info = RoomInfo.from_hash(room_hash['room_info'])
        room.song_queue = SongQueue.from_hash(room_hash['song_queue'])
        room
      end

      def self.check_hash!(room_hash)
        raise InvalidEntityHashError \
          unless ['room_info',
                  'current_song_time',
                  'song_queue'].all? {|k| room_hash.key? k}
      end
    end
  end
end
