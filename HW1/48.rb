puts "Дано ціле число. Знайти суму його цифр."
n = 1357
s = 0

while n > 0
  s += n % 10
  n /= 10
end

p s