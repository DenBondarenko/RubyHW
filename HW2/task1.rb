array = [621, 445, 147, 159, 430, 222, 482, 44, 194, 522, 652, 494, 14, 126, 532, 387, 441, 471, 337, 446, 18, 36, 202, 574, 556, 458, 16, 139, 222, 220, 107, 82, 264, 366, 501, 319, 314, 430, 55, 336]

p array.count

p array.reverse

p array.select.max

p array.select.min

p array.sort

p array.sort.reverse

p array.delete_if &:odd?

p array.delete_if { |i| i%3 != 0 }

p array.uniq!

p array.map { |i| i.to_f / 10}

a = array.select{ |i| i < 50 }
alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

for i in a do
  p alphabet[i]
end

max = array.index(array.max)
min = array.index(array.min)

array[max], array[min] = array[min], array[max]

p array

p array[array.index(array.first)..array.rindex(array.min)-1]

p array.min(3)
