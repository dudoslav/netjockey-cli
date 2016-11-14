module Netjockey
  module Entities
    # Class for storing Room entity
    Room = Struct.new(:room_info,
                      :current_song_time,
                      :song_queue)
  end
end
