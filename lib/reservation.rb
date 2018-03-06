require 'date'


module Hotel
  class Reservation

    attr_reader :ticket_id, :start_date, :end_date, :total_cost

    def initialize(input)
      @ticket_id = input[:ticket_id]
      @start_date = input[:start_date]
      @end_date = input[:end_date]
      @room = input[:room_id]
      # @total_cost = input[:total_cost] == nil ? 0 : input[:total_cost]

      if @end_date < @start_date
        raise ArgumentError('Invalid Date Range')
      end
    end

    def total_cost
      duration = end_date - start_date
      return ((duration - 1) * 200)
    end

    new_ticket[:total_cost] = total_cost(start_date, end_date)

  end
end
