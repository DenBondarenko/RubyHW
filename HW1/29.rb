puts "Дано цілісний масив та інтервал a..b. Знайти максимальний елемент у цьому інтервалі."
a = [1,2,3,4,5,6,7]
b = (3..5)
c = a&b.to_a
p c.select.max
