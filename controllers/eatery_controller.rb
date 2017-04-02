require('sinatra')
require_relative('../models/eatery')

get "/eateries" do
  @eateries = Eatery.all
  erb(:eateries)
end

get "/eateries/:id" do
  @eatery = Eatery.find(params[:id])
  erb(:show_eatery)
end
