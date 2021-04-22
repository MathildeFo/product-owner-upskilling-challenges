require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

get "/" do
  @activities = [
      {
         "Name" => "Escape game",
         "Category" => "ADVENTURE",
         "City" => "Nantes",
         "Duration(min)" => 60,
         "Number of participants" => 4,
         "Price(euros)" => 120,
         "photo_url" => 'https://ad962edbae8ba7b03b7f-d10007df79b5b7a4e475a291e50a08cf.ssl.cf3.rackcdn.com/2101/ouvrir-escape-game.jpg'
      },
      {
         "Name" => "Skydiving",
         "Category" => "ADVENTURE",
         "City" => "Marseille",
         "Duration(min)" => 30,
         "Number of participants" => 6,
         "Price(euros)" => 234,
         "photo_url" => 'https://www.koifaire.com/articles/wp-content/uploads/2016/04/parachutisme-660x400.jpg'
      },
      {
         "Name" => "Boatparty",
         "Category" => "Food and fun",
         "City" => "Marseille",
         "Duration(min)" => 240,
         "Number of participants" => 20,
         "Price(euros)" => 800,
         "photo_url" => 'http://www.zrceboozecruise.com/storage/2016/04/Zrce-Booze-Cruise-2016_04-1.jpg'
      },
  ]

  erb :index
end

get "/components" do
  erb :components
end
