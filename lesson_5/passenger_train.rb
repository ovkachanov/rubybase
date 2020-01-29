class PassengerTrain < Train
  def type
    'пассажирский'
  end

  def add_wagon(wagon)
    if wagon.class == PassengerWagon
      @wagons << wagon
    end
  end
end
