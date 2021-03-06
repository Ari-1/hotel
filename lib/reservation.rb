require 'date'


module Hotel
  class Reservation

    attr_reader :ticket_id, :start_date, :end_date, :room

    @@count = 1

    def initialize(input)

      @ticket_id = @@count
      @start_date = input[:start_date]
      @end_date = input[:end_date]
      @room = input[:room_id]
      @@count += 1

      if @end_date < @start_date
        raise StandardError('Invalid Date Range')
      end

    end


    def total_cost
      duration = end_date - start_date
      return ((duration - 1) * 200)
    end


  end
end
