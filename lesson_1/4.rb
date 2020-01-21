puts 'Введите коэффицент a'
a = gets.chomp.to_i
puts 'Введите коэффицент b'
b = gets.chomp.to_i
puts 'Введите коэффицент c'
c = gets.chomp.to_i

d = b**2 - 4 * a * c

if d > 0
  х1 = (-b + Math.sqrt(d))/(2 * a)
  x2 = (-b - Math.sqrt(d))/(2 * a)
  puts "Корни: x1 = #{х1}, x2 = #{x2}"
elsif d == 0
  x1 = -b/2 * a
  puts "Уравнение имеет один корень равный #{x1}"
else
  puts 'Корней нет'
end
