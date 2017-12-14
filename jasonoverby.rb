require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis"

get "/" do
  @title = 'JASON OVERBY'
  erb :home
end
