puts 'Введите день месяца'
day = gets.chomp.to_i
puts 'Введите месяц'
month = gets.chomp.to_i
puts 'Введите год'
year = gets.chomp.to_i

days_in_months = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]

days_in_months[1] = 29 if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0

buffer_number = days_in_months.take(month-1).sum

index_number = buffer_number + day

puts "Порядковый норм: #{index_number}"
