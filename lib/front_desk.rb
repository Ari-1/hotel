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
      @total_reservations = []
    end

    # list of all rooms
    def room_generator
      count = 1
      ROOM_ID.each do |room|
        @total_rooms << Room.new(count)
      count += 1
      end
      return @total_rooms
    end

    def list_rooms
      return @total_rooms
    end
    # list of all reservations
    def list_reservations
      return @total_reservations
    end

    def available_rooms(start_date, end_date)
      first_date = DateTime.parse(start_date)
       =
    end

    # to create a reservation
    def add_room(start_date, end_date)
          new_ticket = {}
          new_ticket[:ticket_id] = reservation_data.length + 1
          new_ticket[:start_date] = DateTime.parse(start_date)
          new_ticket[:end_date] = DateTime.parse(end_date)

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
