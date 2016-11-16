module Netjockey
  module Entities
    # Class for storing SongQueue entity
    class SongQueue < Struct.new(:playlist)
      def self.from_hash(song_queue_hash)
        check_hash!(song_queue_hash)
        song_queue_hash['playlist'].map do |song|
          Song.from_hash(song)
        end
      end
      
      def self.check_hash!(song_queue_hash)
        raise InvalidEntityHashError \
          unless song_queue_hash.key? 'playlist'
      end
    end
  end
end
