class Station
  attr_reader :trains, :name
  
  include InstanceCounter

  @@all_stations = []

  def self.all
    @@all_stations
  end

  def initialize(name)
    register_instance
    @name = name
    @trains = []
    @@all_stations << self
  end

  def take_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def show_type_trains(type = nil)
    if type
      trains.select { |i| i.type == type }
    else
      trains
    end
  end
end
