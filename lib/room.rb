require 'date'

module Hotel
  class Room

    ROOM_ID = (1..20)

    attr_reader :room_id, :status

    def initialize(room)
      @room_id = room[0]
      @dates_reserved = room[1] = nil ? [] : room[1]

      # unless @room_id =~ ROOM_ID
      #   raise ArgumentError ("Invalid Room Number")
      # end
    end

    def add_reservation(input)

    end

  end
end
