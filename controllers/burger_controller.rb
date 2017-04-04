require('sinatra')
require_relative('../models/burger')

get "/burgers" do
  @burgers = Burger.all
  erb(:burgers)
end


get "/burgers/new" do
  erb(:new_burger)
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
  erb(:show_burger)
end
