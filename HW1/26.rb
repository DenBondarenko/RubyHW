puts "Дано цілісний масив і число К. Вивести індекс останнього елемента, меншого К."
k = 5
a = [1,2,3,4,5,6,7]
p a.rindex{ |i| i < k }