require "json"
require "rest-client"

require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  city=params["city"]
  activity_url = "https://team-building-api.cleverapps.io/v2/activities?city=#{city}"
  response = RestClient.get(activity_url)
  payload = JSON.parse(response.body)
  @activities = payload["activities"]
  erb :index
end

get "/activities/:id" do
  id= params["id"]
  activity_url = "https://team-building-api.cleverapps.io/v2/activities/#{id}"
  response = RestClient.get(activity_url)
  payload = JSON.parse(response.body)
  @activity = payload["activity"]
  erb :activity
end

#@ pour donner accès à la variable dans index.rb
get "/components" do
  erb :components
end
