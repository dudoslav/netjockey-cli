module Netjockey
  # Class for storing Song entity
  class Song
    def initialize(duration, title, id, thumbnail_url, uuid)
      @duration = duration
      @title = title
      @id = id
      @thumbnail_url = thumbnail_url
      @uuid = uuid
    end

    attr_reader :duration
    attr_reader :title
    attr_reader :id
    attr_reader :thumbnail_url
    attr_reader :uuid
  end

  # Class for storing RoomInfo entity
  class RoomInfo
    def initialize(name, id)
      @name = name
      @id = id
    end

    attr_reader :name
    attr_reader :id
  end

  # Class for storing Room entity
  class Room
    def initialize(room_info, current_song_time, song_queue)
      @room_info = room_info
      @current_song_time = current_song_time
      @song_queue = song_queue
    end

    attr_reader :room_info
    attr_reader :current_song_time
    attr_reader :song_queue
  end

  # Class for comunicating with server, fetching data
  class Service
    def initialize(url = 'dudj-jasbar.rhcloud.com')
      @url = url
    end

    def rooms
      res = Net::HTTP.get_response(@url, '/v1/rooms')
      case res
      when Net::HTTPSuccess then
        data = JSON.parse(res.body)
        data['rooms'].map do |room_info|
          RoomInfo.new(room_info['name'], room_info['id'])
        end
      end
    end

    def room(id)
      res = Net::HTTP.get_response(@url, "/v1/room/#{id}")
      case res
      when Net::HTTPSuccess then
        data = JSON.parse(res.body)
        room_info = RoomInfo.new(data['roomInfo']['name'],
                                 data['roomInfo']['id'])
        song_queue = data['queue']['playlist'].map do |song|
          Song.new(song['duration'],
                   song['title'], song['id'],
                   song['thumbnailUrl'],
                   song['uuid'])
        end
        Room.new(room_info, data['currentSongTime'], song_queue)
      end
    end
  end
end
