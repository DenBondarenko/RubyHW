puts "Дано цілісний масив. Перетворіть його, вставивши після кожного негативного елемента нульовий елемент."
a = [0,1,2,3,4,5,6,7,-1,-2,-3]
p a.map { |i| i.negative? ? [i, a[0]] : i }.flatten!