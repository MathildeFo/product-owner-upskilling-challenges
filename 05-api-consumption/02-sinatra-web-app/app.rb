require "json"
require "rest-client"

require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  city=params["city"]
  name=params["name"]
  category=params["category"]
  activity_url = "http://localhost:4567/v2/activities?city=#{city}"
  response = RestClient.get(activity_url)
  payload = JSON.parse(response.body)
  @activities = payload["activities"]
  erb :index
end

get "/activities/:id" do
  id= params["id"]
  activity_url = "http://localhost:4567/v2/activities/#{id}"
  response = RestClient.get(activity_url)
  payload = JSON.parse(response.body)
  @activity = payload["activity"]
  erb :activity
end

#@ pour donner accès à la variable dans index.rb
get "/components" do
  erb :components
end
