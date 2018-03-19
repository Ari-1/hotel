require 'date'


module Hotel
  class Reservation

    attr_reader :ticket_id, :start_date, :end_date

    def initialize(input)
      @ticket_id = input[:ticket_id]
      @start_date = input[:start_date]
      @end_date = input[:end_date]
      @room = input[:room_id]
      @reservations = []

      if @end_date < @start_date
        raise ArgumentError('Invalid Date Range')
      end

      @reservations << input
    end

    def self.all
      return @reservations
    end

    def overlap?(sdate, edate)
      # (StartA <= EndB) and (EndA >= StartB)
      return if start_date <= edate && end_date >= sdate
    end

    def total_cost
      duration = end_date - start_date
      return ((duration - 1) * 200)
    end

    def check_cost(ticket_number)
      @reservation.each do |room|
        if ticket_number == room.ticket_id
          return room.total_cost
        else
          raise ArgumentError('INVALID TICKET NUMBER')
        end
      end

    end



  end
end
