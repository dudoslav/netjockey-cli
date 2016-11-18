require 'net/http'
require 'json'

module Netjockey
  # Class for comunicating with server, fetching data
  class Service
    def initialize(url = 'dudj-jasbar.rhcloud.com')
      @url = url
    end

    def rooms
      res = Net::HTTP.get_response(@url, '/v1/rooms')
      data = JSON.parse(res.body)
      data['rooms'].map do |room_info|
        Entities::RoomInfo.from_hash(room_info)
      end
    end

    def room(id)
      res = Net::HTTP.get_response(@url, "/v1/room/#{id}")
      case res
      when Net::HTTPSuccess then
        data = JSON.parse(res.body)
        Entities::Room.from_hash(data)
      when Net::HTTPNotFound then
        raise Errors::EntityNotFoundError, 'room does not exist'
      end
    end
  end
end
