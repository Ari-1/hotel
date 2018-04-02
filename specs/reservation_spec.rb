require_relative 'spec_helper'
require 'pry'

describe 'Reservation class' do

  describe 'Initialize' do
    it 'can create a new reservation' do
      new_ticket = Hotel::Reservation.new({ start_date: DateTime.parse('3rd Feb 2020'), end_date: DateTime.parse('6th Feb 2020'), room_id: 1})

      new_ticket.must_be_instance_of Hotel::Reservation
    end

    it 'will raise an Error if date range is invalid' do
      proc { Hotel::Reservation.new({ start_date: DateTime.parse('10th Feb 2020'), end_date: DateTime.parse('6th Feb 2020'), room_id: 1}) }.must_raise StandardError
    end
  end

  describe 'total cost' do
    it 'can calculate the total cost of a reservation' do
      new_ticket = Hotel::Reservation.new({ start_date: DateTime.parse('2nd Feb 2020'), end_date: DateTime.parse('6th Feb 2020'), room_id: 1})

      new_ticket.total_cost.must_equal 600
    end
  end

end
