puts "Введите значение основания треугольника"
a = gets.chomp.to_i
puts "Введите значение высоты треугольника"
h = gets.chomp.to_i

triangle_area = 0.5 * a * h

puts "Площадь треугольника равна #{triangle_area}"
