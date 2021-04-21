activity = {
  "Name" => "Escape game",
  "Category" => "ADVENTURE",
  "City" => "Nantes",
  "Duration(min)" => 60,
  "Number of participants" => 4,
  "Price(euros)" => 120
}

puts "#{activity["Name"]} [#{activity["Category"]}]"
puts "Located in #{activity["City"]}"
puts "Duration of #{activity["Duration(min)"]}minutes"
puts "For #{activity["Number of participants"]} participants"
puts "Carged #{activity["Price(euros)"]}euros"
