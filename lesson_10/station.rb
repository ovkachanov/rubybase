# frozen_string_literal: true

class Station
  include InstanceCounter
  include Validation

  validate :name, :present

  attr_reader :trains, :name

  # rubocop:disable Style/ClassVars
  @@all_stations = []
  # rubocop:enable Style/ClassVars

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
end
