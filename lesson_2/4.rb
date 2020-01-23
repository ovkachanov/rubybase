letters =  ('a'..'z').to_a
vowels = ['a','e','i','o','u','y']

letters.each_with_index { |letter, index| puts "#{letter} - #{index + 1}" if vowels.include?(letter) }
