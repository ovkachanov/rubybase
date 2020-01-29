class CargoTrain < Train
  def type
    'грузовой'
  end

  def add_wagon(wagon)
    if wagon.class == CargoWagon
      @wagons << wagon
    end
  end
end
