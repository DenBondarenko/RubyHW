puts "Дано цілісний масив. Знайти кількість його локальних мінімумів."
a = [1,2,3,2,3,4,3,4,5,4,5,6,5,6,7]
p( (1..a.size-2).to_a.select{ |i| (a[i] < a[i-1])&&(a[i] < a[i+1]) }.size )
