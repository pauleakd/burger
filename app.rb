require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/burger_controller')
require_relative('controllers/eatery_controller')
require_relative('controllers/deals_controller')
require_relative('models/day')

get '/' do
  @deals = Deal.all
  erb(:index)
end
