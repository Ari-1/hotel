require_relative 'spec_helper'
require 'pry'


describe 'Front_desk' do

  describe 'Initialize' do
    it 'creates a list of 20 rooms' do
      new_room = Hotel::Front_desk.new
      new_room.total_rooms.must_be_kind_of Array
      new_room.total_rooms.length.must_equal 20

      new_room.total_rooms.each do |room|
        room.must_be_instance_of Hotel::Room
      end
    end
    it 'creates a list of reservations' do
      new_room = Hotel::Front_desk.new
      new_room.reservations.must_be_kind_of Array
    end
  end

  describe 'room data' do
    it 'returns a list of all rooms' do
    end
    # room = Hotel::Front_desk.new
    # room.room_data.must_be_kind_of Array
    end

  describe 'reservation data' do
    it 'can return a list of reservations' do
    end
  end

  describe 'Add Room' do
    it 'can create a reservation' do
      room = Hotel::Front_desk.new

      new_date = room.add_room('3rd Feb 2001', '6th Feb 2001')
      # new_date.must_be_instance_of Hotel::Reservation
      room.reservations.must_include new_date
    end
  end
end
