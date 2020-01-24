class Train
  attr_accessor :speed
  attr_reader :type, :number, :current_station, :current_route

  def initialize(number,type,wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def set_route(route)
    @current_route = route
    @current_station = 0
  end

  def show_current_station
    puts current_route.route[@current_station]
  end

  def show_next_station
    puts current_route.route[@current_station + 1]
  end

  def show_previous_station
    puts current_route.route[@current_station - 1]
  end

  def go_next
    @current_station += 1 unless current_route.route[@current_station + 1].nil?
  end

  def go_back
    @current_station -= 1 unless current_station.zero?
  end

  def stop
    @speed = 0
  end

  def current_speed
    puts "Текущая скорость: #{@speed}"
  end

  def add_wagons
    if speed == 0
      @wagons += 1
    else
      puts 'Нельзя отсоединить вагон на скорости!'
    end
  end

  def delete_wagons
    if speed == 0
      @wagons -= 1
    else
      puts 'Нельзя отсоединить вагон на скорости!'
    end
  end
end
