require 'date'


module Hotel
  class Reservation

    attr_reader

    def initialize(input)
      @ticket_id = input[:ticket_id]
      @start_date = input[:start_date]
      @end_date = input[:end_date]
      @total_cost = input[:total_cost]

      if @end_date < @start_date
        raise ArgumentError('Invalid Date Range')
      end
    end

    def duration

    end

  end
end
