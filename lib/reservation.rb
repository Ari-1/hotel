require 'date'


module Hotel
  class Reservation

    attr_reader :ticket_id, :start_date, :end_date

    @@count = 1

    def initialize(input)
      @ticket_id = @@count
      @start_date = DateTime.parse(input[:start_date])
      @end_date = DateTime.parse(input[:end_date])
      @room = input[:room_id]
      @@count += 1

      correct_date
    end

    def correct_date
      if @end_date < @start_date
        raise ArgumentError('Invalid Date Range')
      end
    end


    def overlap?(sdate, edate)
      # (StartA <= EndB) and (EndA >= StartB)
      return if start_date <= edate && end_date >= sdate
    end

    def total_cost
      duration = end_date - start_date
      return ((duration - 1) * 200)
    end


  end
end
