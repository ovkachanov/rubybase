require_relative "route.rb"
require_relative "station.rb"
require_relative "train.rb"
require_relative "passenger_train.rb"
require_relative "cargo_train.rb"
require_relative "cargo_wagon.rb"
require_relative "passenger_wagon.rb"
require_relative "manager.rb"

puts "Добро пожаловать в интерактивную консоль управления ЖД станциями"

manager = Manager.new
manager.help
manager.menu
