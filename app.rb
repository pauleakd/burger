require('sinatra')
require('pry')
require('sinatra/contrib/all')
require_relative('controllers/burger_controller')
require_relative('controllers/eatery_controller')
require_relative('controllers/deals_controller')
require_relative('controllers/day_controller')
require_relative('controllers/menu_item_controller')
require_relative('models/deal')

get '/' do
  @deals = Deal.all
    @deal = @deals.sample
    erb(:index)
end
