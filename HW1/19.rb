puts "Дано цілісний масив. Знайти середнє арифметичне його елементів."
a = [1,2,3,4,5,6,7]
p (a.inject(0){ |sum, i| sum + i }.to_f) / a.size