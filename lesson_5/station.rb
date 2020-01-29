class Station
  attr_reader :trains, :name

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

  def show_type_trains(type = nil)
    if type
      trains.select { |i| i.type == type }
    else
      trains
    end
  end
end
