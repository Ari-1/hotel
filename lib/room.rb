require 'date'

module Hotel
  class Room


    attr_reader :room_id, :date_range

    def initialize(room)
      @room_id = room[:room_id]
      @date_range = []
#
      unless Front_desk::ROOM_ID.include?(@room_id)
        raise StandardError("INVALID ID")
      end
    end

#
#     def available(start_date, end_date)
#     end
#
#     def add_reservation(input)
#
#     end
#
  end
end
