# frozen_string_literal: true
require_relative 'station.rb'

class Route
  include InstanceCounter
  include CheckValid
  include Validation

  validate :start_station, :type, Station
  validate :end_station, :type, Station

  attr_reader :stations, :start_station, :end_station

  def initialize(start_station, end_station)
    register_instance
    @start_station = start_station
    @end_station = end_station
    @stations = [start_station, end_station]
    validate!
  end

  def add_station(station_name)
    @stations.insert(-2, station_name)
  end

  def delete_station(station_name)
    @stations.delete(station_name)
  end
end
