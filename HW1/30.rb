puts "Дано цілісний масив. Знайти середнє арифметичне модулів його елементів."
a = [1,2,3,4,5,6,7,-1]
p (a.inject(0){ |sum, i| sum + i.abs }.to_f) / a.size
