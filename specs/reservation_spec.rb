require_relative 'spec_helper'
require 'pry'

describe 'Reservation class' do

  describe 'Initialize' do
    it 'can create a new reservation' do
      new_ticket = Hotel::Reservation.new({ start_date: DateTime.parse('3rd Feb 2020'), end_date: DateTime.parse('6th Feb 2020'), room_id: 1})

      new_ticket.must_be_instance_of Hotel::Reservation
    end

    it 'will raise an Error if date range is invalid' do
      proc { Hotel::Reservation.new({ start_date: '10th Feb 2020', end_date: '6th Feb 2020', room_id: 1}) }.must_raise StandardError
    end
  end
end
