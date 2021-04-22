require "json"
require "rest-client"

puts "What is the name of the employee you're looking for? (e.g. Bob Dylan)"
name = gets.chomp # asks user to type something in the Terminal
name_split=name.split

puts "Ok got it! Let's search for that person..."

url ="https://team-building-api.cleverapps.io/v2/employees?first_name=#{name_split[0]}&last_name=#{name_split[1]}"
response = RestClient.get(url)
user = JSON.parse(response.body)

puts "#{user["employees"][0]["first_name"]} #{user["employees"][0]["last_name"]} (#{user["employees"][0]["job_title"]})"
puts "From #{user["employees"][0]["team"]["name"]}"
puts "Working from #{user["employees"][0]["site"]["name"]}"
