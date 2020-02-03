# frozen_string_literal: true

class PassengerWagon < Wagon
  attr_reader :seats

  def initialize(seats)
    @seats = []
    create_seat(seats)
  end

  def type
    'пассажирский'
  end

  def take_place
    if @seats.include?('free_place')
      @seats.pop
      @seats.insert(0, 'taken_place')
    end
  end

  def occupied_places
    occupied_places = @seats.select { |place| place == 'taken_place' }
    occupied_places.count
  end

  def empty_places
    empty_places = @seats.select { |place| place == 'free_place' }
    empty_places.count
  end

  private

  def create_seat(seats)
    seats.times { @seats << 'free_place' }
  end
end
