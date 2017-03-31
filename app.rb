require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/burger_controller')
require_relative('controllers/eatery_controller')
require_relative('models/day')

get '/' do
  @days = Day.all
  erb(:index)
end
