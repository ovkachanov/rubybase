require_relative "manufacturer.rb"
require_relative "instance_counter.rb"
require_relative "route.rb"
require_relative "station.rb"
require_relative "train.rb"
require_relative "passenger_train.rb"
require_relative "cargo_train.rb"
require_relative "wagon.rb"
require_relative "passenger_wagon.rb"
require_relative "cargo_wagon.rb"
require_relative "manager.rb"
require_relative "manufacturer.rb"


puts "Добро пожаловать в интерактивную консоль управления ЖД станциями"

manager = Manager.new
manager.help
manager.menu
