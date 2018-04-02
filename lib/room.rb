require 'date'

module Hotel
  class Room


    attr_reader :room_id, :price, :reservations

    def initialize(room)
      @room_id = room
      @price = 200
      @reservations = []
#
      unless Front_desk::ROOM_ID.include?(@room_id)
        raise StandardError("INVALID ID")
      end
    end

  end
end
