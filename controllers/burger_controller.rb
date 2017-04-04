require('sinatra')
require_relative('../models/burger')

get "/burgers" do
  @burgers = Burger.all
  erb(:burgers)
end

get "/burgers/:id" do
  @burger = Burger.find(params[:id])
  erb(:show_burger)
end

get "burgers/new" do
  erb(:new_burger)
end
