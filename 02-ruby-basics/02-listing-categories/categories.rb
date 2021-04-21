categories = [
  "Adventure",
  "Sport",
  "Visits",
  "Workshops",
  "Cultural",
  "Food"
]

puts "Here the available activites"
categories.each do |name|
  puts "#{name}"
end
puts "Would you like to propose a new activity?"

useractivity = gets.chomp
totalactivity = categories << useractivity

puts "Here all the available activites"
totalactivity.each do |name|
  puts "#{name}"
end

puts Total: totalactivity.size
