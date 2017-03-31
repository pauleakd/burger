require('sinatra')
require_relative('../models/eatery')

get "/eateries" do
  @eateries = Eatery.all
  erb(:eateries)
end
