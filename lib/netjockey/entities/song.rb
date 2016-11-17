module Netjockey
  module Entities
    # Class for storing Song entity
    class Song < Struct.new(:duration,
                            :title,
                            :id,
                            :thumbnail_url,
                            :uuid)
      def self.from_hash(song_hash)
        check_hash!(song_hash)
        song = Song.new
        song.duration = song_hash['duration']
        song.title = song_hash['title']
        song.id = song_hash['id']
        song.thumbnail_url = song_hash['thumbnail_url']
        song.uuid = song_hash['uuid']
        song
      end

      def self.check_hash!(song_hash)
        raise InvalidEntityHashError \
          unless %w(duration
                    title
                    id
                    thumbnail_url
                    uuid).all? { |k| song_hash.key? k }
      end
    end
  end
end
