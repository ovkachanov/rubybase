# frozen_string_literal: true

class Station
  include InstanceCounter
  include CheckValid

  attr_reader :trains, :name

  @@all_stations = []

  def self.all
    @@all_stations
  end

  def initialize(name)
    register_instance
    @name = name
    validate!
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

  def each_train
    @trains.each { |train| yield(train) } unless @trains.empty?
  end

  private

  def validate!
    raise 'Название не может быть пустым' if @name == ''
    raise 'Слишком большое название. Максимум 15символов' if @name.length > 15
    raise 'Такая станциая уже существует' if @@all_stations.map(&:name).include?(@name)
  end
end
