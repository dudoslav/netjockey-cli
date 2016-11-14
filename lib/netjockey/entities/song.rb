module Netjockey
  module Entities
    # Class for storing Song entity
    Song = Struct.new(:duration,
                      :title,
                      :id,
                      :thumbnail_url,
                      :uuid)
  end
end
