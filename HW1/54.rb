puts "Дано цілісний масив. Замінити всі негативні елементи на значення мінімального."
a = [0,1,2,3,4,5,6,7,-1,-2,-3]
p a.map { |i| i.negative? ? [a.min] : i }.flatten!
