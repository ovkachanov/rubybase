class Train
  attr_accessor :speed
  attr_reader :type, :number, :current_route, :current_station

  def initialize(number,type,wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def show_current_route
    puts @current_route.stations.map(&:name).join('->')
  end

  def set_route(route)
    @current_route = route
    @current_station = @current_route.stations.first
    @current_station.take_train(self)
  end

  def show_next_station
    station_index = @current_route.stations.index(@current_station)
    @current_route.stations[station_index + 1]
  end

  def show_previous_station
    station_index = @current_route.stations.index(@current_station)
    @current_route.stations[station_index - 1]
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

  def add_wagons
    @wagons += 1 if speed == 0
  end

  def delete_wagons
    @wagons -= 1 if speed == 0
  end
end
