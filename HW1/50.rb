puts "Дано цілісний масив. Знайти кількість елементів між першим і останнім мінімальним."
a = [1,2,3,4,5,6,7,1,3,5,7]
b = a.min
p a[a.index(b)+1..a.rindex(b)-1]
