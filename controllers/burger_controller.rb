require('sinatra')
require_relative('../models/burger')

get "/burgers" do
  @burgers = Burger.all
  erb(:burgers)
end
