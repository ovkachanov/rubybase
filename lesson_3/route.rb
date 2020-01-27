class Route
  attr_reader :stations

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
  end

  def add_station(station_name)
    @stations.insert(-2, station_name)
  end

  def delete_station(station_name)
    @stations.delete(station_name)
  end
end
