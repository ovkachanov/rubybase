class Manager
  def initialize
    @trains = []
    @stations = []
    @routes = []
  end

  def help
    puts '1 - Создать станцию'
    puts '2 - Создать поезд'
    puts '3 - Создать маршрут'
    puts '4 - Изменения маршрута (добавление и удаление станций)'
    puts '5 - Назначить маршрут поезду'
    puts '6 - Добавить вагон к поезду'
    puts '7 - Отцепить вагон у поезда'
    puts '8 - Перемещение поезда по маршруту'
    puts '9 - Список всех станций'
    puts '10 - Просмотр поездов на станции'
    puts '11 - Купить билет'
    puts '12 - Загрузить грузовой вагон'
    puts '13 - Помощь'
    puts '14 - Выйти'
  end

  def menu
    begin
      loop do
        print 'Выберите нужный пункт - '
        choice = gets.chomp.to_i
        case choice
        when 1
          create_station
        when 2
          create_train
        when 3
          create_route
        when 4
          change_route
        when 5
          set_route
        when 6
          add_wagon
        when 7
          delete_wagon
        when 8
          movement_train
        when 9
          show_stations
        when 10
          show_station_trains
        when 11
          take_place
        when 12
          take_volume
        when 13
          help
        when ir14
          exit
        else
          puts 'Неправильная команда, используйте help для вывода списка доступных команд'
        end
      end
    rescue RuntimeError => e
      exception_log(e)
      retry
    rescue NoMethodError => e
      exception_log(e)
      retry
    end
  end

  private

  def create_station
    puts 'Введите название станции'
    name = gets.chomp.to_s
    station = Station.new(name = name)
    @stations << station
  end

  def create_train
    puts "Выберите тип поезда:\n1.Пассажирский\n2.Грузовой"
    type = gets.chomp.to_i
    puts "Введите номер поезда"
    number = gets.chomp

    if type == 1
      @trains << PassengerTrain.new(number)
      puts "Поезд №#{number} успешно создан!"
    elsif type == 2
      @trains << CargoTrain.new(number)
      puts "Поезд №#{number} успешно создан!"
    end
  end

  def create_route
    puts 'Введите начальную станцию маршрута'
    @stations.each_with_index { |station, x| puts "#{x + 1}. #{station.name}" }
    choice_start_station = gets.chomp.to_i - 1
    puts 'Введите конечную станцию маршрута'
    choice_end_station = gets.chomp.to_i - 1
    @routes << Route.new(start_station = @stations[choice_start_station], end_station = @stations[choice_end_station])
    puts "Маршрут построен. Начальная станция #{@routes.last.stations.first.name} - Конечная станция #{@routes.last.stations.last.name}"
  end

  def change_route
    @routes.each.with_index { |route, x| puts "#{x + 1}: #{route.stations.first.name} - #{route.stations.last.name}" }
    choice_route_index = gets.chomp.to_i - 1
    edit_route = @routes[choice_route_index]
    puts "Выберите действие:\n1.Добавить станцию\n2.Удалить станцию"
    user_choice = gets.chomp.to_i

    if user_choice == 1
      puts "Введите станцию"
      show_stations
      station_number = gets.chomp.to_i - 1
      edit_route.add_station(@stations[station_number])
    elsif user_choice == 2
      puts "Введите станцию"
      edit_route.stations.each_with_index { |station, x| puts "#{x + 1}. #{station.name}" }
      station_number = gets.chomp.to_i - 1
      edit_route.delete_station(@stations[station_number])
    end
  end

  def set_route
    puts 'Выберите поезд на назначения маршрута'
    @trains.each.with_index { |train, x| puts "#{x + 1}: Поезд № #{train.number}" }
    choice_train_index = gets.chomp.to_i - 1
    edit_train = @trains[choice_train_index]
    puts 'Выбирите марштрут'
    @routes.each.with_index { |route, x| puts "#{x + 1}: #{route.stations.first.name} - #{route.stations.last.name}" }
    choice_route_index = gets.chomp.to_i - 1
    route = @routes[choice_route_index]
    edit_train.set_route(route)
    puts "Поезду №#{edit_train.number} назначен маршрут #{route.stations.first.name} - #{route.stations.last.name}"
  end

  def add_wagon
    puts 'Выбирите поезд к которому необходимо прицепить вагоны'
    @trains.each.with_index { |train, x| puts "#{x + 1}: Поезд № #{train.number}" }
    choice_train_index = gets.chomp.to_i - 1
    edit_train = @trains[choice_train_index]
    puts 'Введите количество вагонов'
    quantity = gets.chomp.to_i

    if edit_train.type == 'пассажирский'
      puts 'Введите количество мест в вагоне'
      quantity_place = gets.chomp.to_i

      quantity.times { edit_train.add_wagons(PassengerWagon.new(quantity_place)) }
      puts "К поезду №#{edit_train.number} было прицеплено #{quantity} вагон(а) вместимостью в каждом #{quantity_place} мест(a)"
    else
      puts 'Введите объем грузового вагона'
      volume = gets.chomp.to_i
      quantity.times { edit_train.add_wagons(CargoWagon.new(volume)) }
      puts "К поезду №#{edit_train.number} было прицеплено #{quantity} вагон(а). Объем кажого вагона #{volume} м3"
    end
  end

  def delete_wagon
    puts 'Выбирите поезд от которого необходимо отцепить вагоны'
    @trains.each_with_index { |train, x| puts "#{x + 1}: Поезд № #{train.number}" }
    choice_train_index = gets.chomp.to_i - 1
    edit_train = @trains[choice_train_index]
    puts 'Введите количество вагонов'
    quantity = gets.chomp.to_i

    if edit_train.wagons.size - quantity > 0
      quantity.times { edit_train.delete_wagons }
      puts "От поезда №#{edit_train.number} было отцеплено #{quantity} вагон(а)"
    else
      puts "Невозможно отцепить #{quantity} вагонов т.к всего вагонов #{edit_train.wagons.size}"
    end
  end

  def movement_train
    puts 'Выбирите поезд для перемещения'
    @trains.each.with_index { |train, x| puts "#{x + 1}: Поезд № #{train.number}" }
    choice_train_index = gets.chomp.to_i - 1
    edit_train = @trains[choice_train_index]
    puts "Выберите действие:\n1.Следовать на следующую станцию\n2.Следовать на предыдущую станцию"
    user_choice = gets.chomp.to_i

    if route_set?(edit_train)
      if user_choice == 1
        edit_train.go_next
        puts "Поезд прибыл на станцию #{edit_train.current_station.name}"
      elsif user_choice == 2
        edit_train.go_back
        puts "Поезд прибыл на станцию #{edit_train.current_station.name}"
      end
    else
      puts 'На данный момент поезду не назначен маршрут!'
    end
  end

  def show_station_trains
    puts 'Выберите станцию'
    show_stations
    station_index = gets.chomp.to_i - 1
    station = @stations[station_index]

    if station.trains.size > 0
      station.trains.each_with_index { |train, x| puts "#{x + 1}. Поезд №#{train.number}" }
    else
      puts 'На данной станции нет поездов'
    end
  end

  def take_place
    puts 'Выбирите поезд в котором хотите купить билет'
    @trains.each_with_index { |train, x| puts "#{x + 1}: Поезд № #{train.number}" }
    choice_train_index = gets.chomp.to_i - 1
    edit_train = @trains[choice_train_index]

    if edit_train.wagons.size > 0
      if edit_train.type == 'пассажирский'
        puts 'Выбирите номер вагона'
        edit_train.wagons.each_with_index { |wagon, x| puts "#{x + 1}: Вагон № #{x + 1}" }
        choice_wagon_index = gets.chomp.to_i - 1
        edit_wagon = edit_train.wagons[choice_wagon_index]
        edit_wagon.take_place
        puts 'Вы купили билет!'
        puts "В вагоне осталось свободных мест(а) #{edit_wagon.empty_places}, занято #{edit_wagon.occupied_places} мест(а)"
      else
        puts "Это грузовой поезд!"
      end
    else
      puts 'У поезда нет вагонов, сначала прицепите вагоны'
    end
  end

  def take_volume
    puts 'Выбирите поезд в котором хотите загрузить вагон'
    @trains.each_with_index { |train, x| puts "#{x + 1}: Поезд № #{train.number}" }
    choice_train_index = gets.chomp.to_i - 1
    edit_train = @trains[choice_train_index]

    if edit_train.wagons.size > 0
      if edit_train.type == 'грузовой'
        puts 'Выбирите номер вагона'
        edit_train.wagons.each_with_index { |wagon, x| puts "#{x + 1}: Вагон № #{x + 1}" }
        choice_wagon_index = gets.chomp.to_i - 1
        edit_wagon = edit_train.wagons[choice_wagon_index]
        puts 'Введите количество для загрузки'
        value_choice = gets.chomp.to_i
        edit_wagon.take_volume(value_choice)
        puts "Вы загрузили вагон на #{value_choice} м3. Свобойдно объема #{edit_wagon.free_volume} м3, занято #{edit_wagon.taken_volume}"
      else
        puts "Это пассажирский поезд!"
      end
    else
      puts 'У поезда нет вагонов, сначала прицепите вагоны'
    end
  end

  def show_stations
    @stations.each_with_index { |station, x| puts "#{x + 1}. #{station.name}" }
  end

  def route_set?(train)
    !train.current_route.nil?
  end

  def exception_log(e)
    puts "---------------------------------------"
    puts "Произошла ошибка подробнее #{e.message}"
    puts "---------------------------------------"
  end
end
