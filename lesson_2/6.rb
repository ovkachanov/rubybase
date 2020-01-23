products = {}
total_price = 0

loop do
  puts 'Введите название товара, для выхода нажмите "стоп"'

  title = gets.chomp.to_s
  break if title == 'стоп'

  puts 'Введите цену'
  price = gets.chomp.to_f

  puts 'Введите количество'
  quantity = gets.chomp.to_f

  products.merge!({ title => { price => quantity } })
end

puts products

products.each { |key, value| puts "Товар #{key} итоговая цена: #{value.first[0] * value.first[1]}" }

products.each_value { |value| total_price += value.first[0] * value.first[1] }

puts "Итоговая цена: #{total_price}"
