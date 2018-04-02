require 'date'

require_relative '../lib/reservation.rb'
require_relative '../lib/room.rb'

module Hotel
  class Front_desk

    attr_reader :total_rooms, :total_reservations

    ROOM_ID = (1..20)

    def initialize
      # an array of rooms
      @total_rooms = room_generator
      @total_reservations = []
    end

    # list of all rooms
    def room_generator
      new_room = []
      count = 1
      ROOM_ID.each do |room|
        new_room << Room.new(count)
      count += 1
      end
      return new_room
    end

    def list_rooms
      return @total_rooms
    end
    # list of all reservations
    def list_reservations
      return @total_reservations
    end

    def available?(start_date, end_date)
      available_rooms = []
      first_day = DateTime.parse(start_date)
      last_day = DateTime.parse(end_date)
      # (StartA <= EndB) and (EndA >= StartB)

      @total_reservations.each do |reserve|
        if first_day <= (reserve.end_date - 1) && last_day >= reserve.start_date
          open_room = reserve.room
          @total_rooms.reject! { |room| room.room_id == open_room }
        end
      end

      @total_rooms.each do |room|
        available_rooms << room.room_id
      end
      return available_rooms
    end

    # to create a reservation
    def add_room(start_date, end_date)
      new_ticket = {}
      new_ticket[:ticket_id] = 0
      available = available?(start_date, end_date)

      new_ticket[:room_id] = available[0]

      new_ticket[:start_date] = DateTime.parse(start_date)
      new_ticket[:end_date] = DateTime.parse(end_date)

      reserved = Hotel::Reservation.new(new_ticket)

      @total_reservations << reserved

      return reserved
    end


  end
end
