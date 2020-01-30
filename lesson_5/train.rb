class Train
  attr_accessor :speed
  attr_reader :type, :number, :current_route, :current_station, :wagons

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
  end

  def set_route(route)
    @current_route = route
    @current_station = @current_route.stations.first
    @current_station.take_train(self)
  end

  def go_next
    @current_station.send_train(self)
    @current_station = show_next_station
    @current_station.take_train(self)
  end

  def go_back
    @current_station.send_train(self)
    @current_station = show_previous_station
    @current_station.take_train(self)
  end

  def stop
    @speed = 0
  end

  def add_wagons(wagon)
    @wagons << wagon
  end

  def delete_wagons
    @wagons.delete_at(0)
  end

  private

  def show_next_station
    station_index = @current_route.stations.index(@current_station)
    @current_route.stations[station_index + 1]
  end

  def show_previous_station
    station_index = @current_route.stations.index(@current_station)
    @current_route.stations[station_index - 1]
  end
end
