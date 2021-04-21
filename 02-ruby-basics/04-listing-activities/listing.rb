activities = [
 {
    "Name" => "Escape game",
    "Category" => "ADVENTURE",
    "City" => "Nantes",
    "Duration(min)" => 60,
    "Number of participants" => 4,
    "Price(euros)" => 120
  },
  {
    "Name" => "Skydiving",
    "Category" => "ADVENTURE",
    "City" => "Marseille",
    "Duration(min)" => 30,
    "Number of participants" => 6,
    "Price(euros)" => 234
  },
  {
    "Name" => "Boatparty",
    "Category" => "Food and fun",
    "City" => "Marseille",
    "Duration(min)" => 240,
    "Number of participants" => 20,
    "Price(euros)" => 800
  },
]

activities.each do |activity|
  puts "#{activity["Name"]} [#{activity["Category"]}]"
  puts "Located in #{activity["City"]}"
  puts "Duration of #{activity["Duration(min)"]}minutes"
  puts "For #{activity["Number of participants"]} participants"
  puts "Charged #{activity["Price(euros)"]}euros"
  puts "---------"
end
