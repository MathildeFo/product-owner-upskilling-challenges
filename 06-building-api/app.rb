require "sinatra"
require "sinatra/json"
require "sinatra/link_header"
require "sinatra/namespace"
require "sinatra/reloader" if development?

require "sqlite3"

enable :static

DB_PATH = File.join(__dir__, "db/team_building.sqlite")
DB      = SQLite3::Database.new(DB_PATH)
DB.results_as_hash = true

before do
  if request.get_header("CONTENT_TYPE") == "application/json"
    params.merge!(JSON.parse(request.body.read))
  end
end

get "/" do
  json "name" => "Team Building API", "status" => "Running"
end

namespace "/v1" do

  get "/activities" do
  activities = DB.execute("SELECT * from activities ORDER BY name")

  json "activities" => activities
  end

  get "/activities/:id" do
  id=params["id"]
  activity = DB.execute("SELECT * from activities WHERE id=#{id}").first

  json "activity" => activity
 end
end


namespace "/v2" do

  get "/activities" do
    city=params["city"]
    category=params["category"]
    search=params["search"]
    query = []

    if city != nil && city != ""
        query << "city=\"#{city}\""
    end

    if category != nil && category != ""
       query << "category=\"#{category}\""
    end

    if search != nil && search != ""
      query << "name like \"%#{search}%\""
    end

    query_total= query.join('AND ')

    if query_total.empty? == false
    activities = DB.execute("SELECT * from activities WHERE #{query_total} ORDER BY name")
    else
    activities = DB.execute("SELECT * from activities ORDER BY name")
    end

    json "activities" => activities
  end

  get "/activities/:id" do
    id=params["id"]
    activity = DB.execute("SELECT * from activities WHERE id=#{id}").first

    json "activity" => activity
  end

end

namespace "/doc" do
  get { erb :"doc/index" }

  namespace "/v1" do
    get "/activities" do
      erb :"doc/v1/activities"
    end
  end

  namespace "/v2" do
    get "/activities" do
      erb :"doc/v2/activities"
    end
  end
end
