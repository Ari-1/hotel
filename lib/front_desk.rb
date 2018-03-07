require 'date'

require_relative 'reservation'
require_relative 'room'

module Hotel
  class Front_desk

    attr_reader :total_rooms, :reservations

    def initialize
      # an array of rooms
      @total_rooms = []
      count = 1
      Room::ROOM_ID.each do |room|
        @total_rooms << Room.new([count])
        count += 1
      end
      @reservations = []
    end

    # list of all rooms
    def room_data
      @total_rooms.each do |r|
        return "#{r.room_id}"
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

      new_reserve = Hotel::Reservation.new(new_ticket)

      @reservations << new_reserve
      return new_reserve
    end

    # to check availablity
    def check_date(date)
      check_day = Date.parse(date)
      @total_rooms.each do |room|
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
