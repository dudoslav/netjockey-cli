require 'thor'

module Netjockey
  # Class for Netjockey command line interface
  class CLI < Thor
    desc 'list', 'lists all rooms on netjockey server'
    def list
      Netjockey::Service.new.rooms.each do |room_info|
        puts "#{room_info.id} | #{room_info.name}"
      end
    end

    desc 'room ID', 'prints room object'
    def room(id)
      room = Netjockey::Service.new.room(id)
      puts "Name: #{room.room_info.name}"
      puts "Song time: #{room.current_song_time}"
      room.song_queue.each { |song| puts "#{song.duration} | #{song.title}" }
    end
  end
end
