puts "Дано цілісний масив. Замінити всі позитивні елементи на значення максимального."
a = [0,1,2,3,4,5,6,7,-1,-2,-3]
p a.map { |i| i.positive? ? [a.max] : i }.flatten!