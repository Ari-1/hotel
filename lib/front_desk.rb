require 'date'

require_relative 'reservation'
require_relative 'room'

module Hotel
  class Front_desk

    attr_reader :total_rooms, :reservations

    ROOM_ID = (1..20)

    def initialize
      # an array of rooms
      @total_rooms = room_generator
    end

    # list of all rooms
    def room_generator
      count = 1
      ROOM_ID.each do |room|
        @total_rooms << Room.new(count)
      count += 1
      end
    end

    def list_rooms
      return @total_rooms
    end
    # list of all reservations
    def reservation_data
      return Hotel::Reservation.all
    end

    def valid_date?(str, format = "%m/%d/%Y")
      Date.strptime(str,format) rescue false
    end

    # to create a reservation
    def add_room(start_date, end_date)
      if valid_date?(start_date)
        if valid_date?(end_date)
          new_ticket = {}
          new_ticket[:ticket_id] = reservation_data.length + 1
          new_ticket[:start_date] = Date.parse(start_date)
          new_ticket[:end_date] = Date.parse(end_date)

          @total_rooms.find do |room|
            new_ticket[:room_id] = room.sample
          end

          reservaton_data.each do |room|
            unless room.overlap?(start_date, end_date)
              new_ticket[:room_id] = room.room_id
            end
          end

          reserved = Hotel::Reservation.new(new_ticket)
          @reservations << reserved
          return reserved
        else
          raise ArgumentError("INVALID END DATE")
        end
      else
        raise ArgumentError("INVALID START DATE")
      end
    end


    # to check availablity
    def check_date(date)
    # check_day = Date.parse(date)
    end


  end
end
