require 'date'

module Hotel
  class Room

    attr_reader :room_id, :price, :reservations

    def initialize(room)
      @room_id = room
      @price = 200
    end

  end
end
