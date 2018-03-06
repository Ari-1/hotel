require 'date'

require_relative 'reservation'
require_relative 'room'

module Hotel
  class Front_Desk

    attr_reader :rooms, :reservations

    def initialize
      # an array of rooms
      @rooms = []
      count = 1
      Room::ROOM_ID.each do |room|
        @rooms << Room.new(
          {
            room_number: count,
            dates_reserved: []
          }
        )
        count += 1
      end
      @reservation = []
    end

    # list of all rooms
    def room_data
      @rooms.each do |room|
        return room
      end
    end

    # list of all reservations
    def reservation_data
      @reservations.each do |reserved|
        return "#{reserved}, Total Cost: #{reserved.total_cost}"
      end
    end

    # to create a reservation
    def add_room(start_date, end_date)
      new_ticket = {}
      new_ticket[:ticket_id] = @reservations.length + 1
      new_ticket[:start_date] = Date.parse(start_date)
      new_ticket[:end_date] = Date.parse(end_date)

      new_reserve = Reservaton.new(new_ticket)

      @reservations << new_reserve
      return new_reserve
    end

    # to check availablity
    def check_date(date)
      check_day = Date.parse(date)
      @rooms.each do |room|
        room[:date_range].each do |day|
          if room[:date_range].include(check_day)
            return "Room ##{[:room_number]} is reserved"
          end
        end
        return "No reservations."
      end
    end


  end
end
