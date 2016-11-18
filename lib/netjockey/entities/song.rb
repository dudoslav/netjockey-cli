module Netjockey
  module Entities
    # Class for storing Song entity
    Song = Struct.new(:duration,
                      :title,
                      :id,
                      :thumbnail_url,
                      :uuid) do
      def self.from_hash(song_hash)
        check_hash!(song_hash)
        song = Song.new
        song.duration = song_hash['duration']
        song.title = song_hash['title']
        song.id = song_hash['id']
        song.thumbnail_url = song_hash['thumbnailUrl']
        song.uuid = song_hash['uuid']
        song
      end

      def self.check_hash!(song_hash)
        raise Errors::InvalidEntityHashError \
          unless %w(duration
                    title
                    id
                    thumbnailUrl
                    uuid).all? { |k| song_hash.key? k }
      end
    end
  end
end
