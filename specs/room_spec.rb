require_relative 'spec_helper'


describe 'Room' do
  describe 'Initialize' do
    it 'can create a new room' do
      new_room = Hotel::Room.new(21)
      new_room.room_id.must_equal 21
      new_room.must_be_instance_of Hotel::Room
    end
  end

end
