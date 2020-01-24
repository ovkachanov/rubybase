class Route
  attr_reader :route

  def initialize(start_station, end_station)
    @route = [start_station, end_station]
  end

  def add_station(station_name)
    @route.insert(-2, station_name)
  end

  def delete_station(station_name)
    @route.delete(station_name)
  end

  def list_station
    @route.each { |station| puts station }
  end
end
