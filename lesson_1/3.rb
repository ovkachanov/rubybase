puts 'Введите значение стороны a'
a = gets.chomp.to_i
puts 'Введите значение стороны b'
b = gets.chomp.to_i
puts 'Введите значение стороны c'
c = gets.chomp.to_i

a, b, h = [a, b, c].sort

if a == b && a == c && b == c
  puts 'треугольник равнобедренный и равносторонний'
elsif a == b || b == c
  puts 'треугольник равносторонний'
else h**2 == a**2 + b**2
  puts 'треугольник прямоугольный'
end
