puts "Дано цілісний масив. Знайти максимальний парний елемент."
a = [1,2,3,4,5,6,7,1,7]
p a.select{ |i| i%2 == 0 }.max