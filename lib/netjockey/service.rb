module Netjockey
  # Class for comunicating with server, fetching data
  class Service
    def initialize(url = 'dudj-jasbar.rhcloud.com')
      @url = url
    end

    def rooms
      res = Net::HTTP.get_response(@url, '/v1/rooms')
      raise 'cannot fatch rooms list' unless res.is_a?(Net::HTTPSuccess)
      data = JSON.parse(res.body)
      data['rooms'].map do |room_info|
        RoomInfo.new(room_info['name'], room_info['id'])
      end
    end

    def room(id)
      res = Net::HTTP.get_response(@url, "/v1/room/#{id}")
      case res
      when Net::HTTPSuccess then
        data = JSON.parse(res.body)
        create_room(data)
      when Net::HTTPNotFound then
        raise 'room not found'
      end
    end

    def create_room(room_hash)
      room_info = RoomInfo.new(room_hash['roomInfo']['name'],
                               room_hash['roomInfo']['id'])
      Room.new(room_info,
               room_hash['currentSongTime'],
               create_songs(room_hash['queue']['playlist']))
    end

    def create_songs(song_queue_hash)
      song_queue_hash.map do |song|
        Song.new(song['duration'],
                 song['title'], song['id'],
                 song['thumbnailUrl'],
                 song['uuid'])
      end
    end

    private :create_room, :create_songs
  end
end
