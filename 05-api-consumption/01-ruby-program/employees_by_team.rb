require "json"
require "rest-client"

puts "What is the team of the employees you're looking for? (e.g. UI / UX)"
team = gets.chomp # asks user to type something in the Terminal

puts "Ok got it! Let's search for the employees..."

urlteam= "https://team-building-api.cleverapps.io/v2/teams?search=#{team}"
responseteam = RestClient.get(urlteam)
teamjson = JSON.parse(responseteam.body)
idteam = teamjson["teams"][0]['id']

url ="https://team-building-api.cleverapps.io/v2/employees?team_id=#{idteam}"
response = RestClient.get(url)
user = JSON.parse(response.body)

employees=user["employees"]

puts "Total: #{employees.size} people found"

user["employees"].each do |employee|
puts "#{employee["first_name"]} #{employee["last_name"]} "
puts "#{employee["job_title"]}"
puts "- - - - -"
end
