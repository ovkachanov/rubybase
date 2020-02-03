# frozen_string_literal: true

class Route
  include InstanceCounter
  include CheckValid

  attr_reader :stations

  def initialize(start_station, end_station)
    register_instance
    @stations = [start_station, end_station]
    validate!
  end

  def add_station(station_name)
    @stations.insert(-2, station_name)
  end

  def delete_station(station_name)
    @stations.delete(station_name)
  end

  private

  def validate!
    unless @stations.first.is_a?(Station) && @stations.last.is_a?(Station)
      raise 'Переданы неверные аргументы'
    end
  end
end
