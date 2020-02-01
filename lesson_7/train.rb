class Train
  attr_accessor :speed
  attr_reader :type, :number, :current_route, :current_station, :wagons

  NUMBER = /^[a-zа-я0-9]{3}-?[a-zа-я0-9]{2}$/i

  include Manufacturer
  include InstanceCounter
  include CheckValid

  @@trains = {}

  def self.find(number)
    @@trains[number]
  end

  def initialize(number)
    @number = number
    validate!
    @wagons = []
    @speed = 0
    @@trains[@number] = self
    register_instance
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

  def validate!
    raise 'Номер должен быть задан!' if @number == ''
    raise 'Неверный формат номера. Образец XXX-XX или XXXXX' if self.number !~ NUMBER
    raise 'Такой поезд уже существует' if @@trains.has_key?(self.number)
  end

  def show_next_station
    station_index = @current_route.stations.index(@current_station)
    @current_route.stations[station_index + 1]
  end

  def show_previous_station
    station_index = @current_route.stations.index(@current_station)
    @current_route.stations[station_index - 1]
  end
end
