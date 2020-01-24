class Station
  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def all_trains
    @trains.each { |train| puts "#{train}" }
  end

  def show_type_trains
    passanger_trains = []
    cargo_trains = []
    @trains.each do |train|
      if train.type == 'пассажирский'
        passanger_trains << train
      elsif train.type == 'грузовой'
        cargo_trains << train
      end
    end
    passanger_trains.each { |train| puts train.number }
    cargo_trains.each { |train| puts train.number }
    puts "Пассажирских поездов: #{passanger_trains.size}"
    puts "Пассажирских поездов: #{cargo_trains.size}"
  end
end
