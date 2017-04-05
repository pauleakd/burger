require('sinatra')
require_relative('../models/eatery')

get "/eateries" do
  @eateries = Eatery.all
  erb(:"eateries/eateries")
end

get "/eateries/new" do
  erb(:"eateries/new_eatery")
end

post "/eateries/new" do
  @eatery = Eatery.new(params)
  @eatery.save()
  redirect '/eateries'
end

post '/eateries/:id/delete' do
  Eatery.delete(params[:id])
  redirect "/eateries"
end

get "/eateries/:id" do
  @eatery = Eatery.find(params[:id])
  @menu_items = @eatery.menu_items
  erb(:"eateries/show_eatery")
end
