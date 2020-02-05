# frozen_string_literal: true

class CargoWagon < Wagon
  attr_reader :free_volume, :taken_volume, :etalon_volume

  def initialize(volume)
    @etalon_volume = volume
    initialize_values
  end

  def type
    'грузовой'
  end

  # rubocop:disable Style/GuardClause:
  def take_volume(value)
    if @etalon_volume > @taken_volume && @free_volume - value >= 0
      @taken_volume += value
      @free_volume -= value
    end
  end
  # rubocop:enable Style/GuardClause:

  private

  def initialize_values
    @taken_volume = 0
    @free_volume = @etalon_volume
  end
end
