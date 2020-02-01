class Route
  attr_reader :stations

  include InstanceCounter
  include Validation

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
    raise 'Переданы неверные аргументы' unless (@stations.first.kind_of?(Station)) && (@stations.last.kind_of?(Station))
  end
end
