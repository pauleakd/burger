require('sinatra')
require_relative('../models/eatery')

get "/eateries" do
  @eateries = Eatery.all
  erb(:eateries)
end

get "/eateries/new" do
  erb(:new_eatery)
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
  erb(:show_eatery)
end
