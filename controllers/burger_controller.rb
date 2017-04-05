require('sinatra')
require_relative('../models/burger')

get "/burgers" do
  @burgers = Burger.all
  erb(:"/burgers/burgers")
end


get "/burgers/new" do
  erb(:"/burgers/new_burger")
end

post "/burgers/new" do
  @burger = Burger.new(params)
  @burger.save()
  redirect '/burgers'
end

post '/burgers/:id/delete' do
  Burger.delete(params[:id])
  redirect "/burgers"
end


get "/burgers/:id" do
  @burger = Burger.find(params[:id])
  erb(:"/burgers/show_burger")
end
