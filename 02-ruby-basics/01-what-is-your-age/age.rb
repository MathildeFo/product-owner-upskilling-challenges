puts "What is your name?"
name = gets.chomp # asks user to type something in the Terminal

puts "Ok got it!"

puts "What is your year of birth?"
year = gets.chomp
yearinter = year.to_i
age= 2021-yearinter
puts "Hey #{name}, Your are so old! You will be #{age} this year."
