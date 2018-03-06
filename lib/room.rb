require 'date'

require_relative 'front_desk'
require_relative 'reservation'

module Hotel
  class Room

    ROOM_ID = (1..20)

    attr_reader :room_id, :status

    def initialize(room)
      @room_id = room[:room_number]
      @reserved_dates = room[:dates_reserved]

      unless @room_id =~ ROOM_ID
        raise ArgumentError ("Invalid Room Number")
      end
    end

    def add_reservation(input)

    end

  end
end
