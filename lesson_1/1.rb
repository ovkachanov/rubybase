puts "Это программа позволяет вычислять идеальный вес"
puts "Как Вас зовут?"
name = gets.chomp

puts "Какой у Вас рост?"
height = gets.chomp.to_i

ideal_weight = (height- 110) * 1.15

if ideal_weight > 0
  puts "#{name} Ваш идеальный вес равен #{ideal_weight}"
else
  puts "Ваш вес уже оптимальный"
end
