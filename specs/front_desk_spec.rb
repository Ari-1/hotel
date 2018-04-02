require_relative 'spec_helper'
require 'pry'

describe 'Front_desk' do

  describe 'Initialize' do
    it 'creates a list of 20 rooms' do
      admin = Hotel::Front_desk.new
      admin.total_rooms.must_be_kind_of Array
      admin.total_rooms.length.must_equal 20

      admin.total_rooms.each do |room|
        room.must_be_instance_of Hotel::Room
      end
    end

    it 'creates a list of reservations' do
      admin = Hotel::Front_desk.new
      admin.total_reservations.must_be_kind_of Array

      admin.total_reservations.each do |room|
        room.must_be_instance_of Hotel::Reservation
      end
    end
  end

  describe 'list of rooms' do
    it 'returns a list of all rooms' do
      admin = Hotel::Front_desk.new
      admin.list_rooms.must_be_kind_of Array
      admin.list_rooms[10].must_be_kind_of Hotel::Room
      admin.list_rooms[0].must_be_kind_of Hotel::Room
      admin.list_rooms[21].must_be_nil
    end
  end

  describe 'list of reservations' do
    it 'can return a list of reservations' do
      admin = Hotel::Front_desk.new
      admin.add_room('3rd Feb 2020', '6th Feb 2020')
      admin.total_reservations.must_be_kind_of Array
      admin.total_reservations[0].must_be_instance_of Hotel::Reservation
      admin.total_reservations[1].must_be_nil
    end
  end

  describe 'available?' do
    it 'returns a list of available rooms within the given dates' do

      admin = Hotel::Front_desk.new
      admin.add_room('4th Feb 2020', '6th Feb 2020')
      admin.add_room('1st Feb 2020', '3rd Feb 2020')
      admin.add_room('20th Mar 2020', '31st Mar 2020')

      available_rooms = admin.available?('1st Feb 2020', '5th Feb 2020')

      available_rooms.wont_include 1
      available_rooms.must_be_kind_of Array
    end
  end


  describe 'Add Room' do
    it 'can create a reservation' do
      admin = Hotel::Front_desk.new
      new_date = admin.add_room('3rd Feb 2020', '6th Feb 2020')

      admin.total_reservations.must_include new_date
      new_date.must_be_kind_of Hotel::Reservation
    end
  end

end
