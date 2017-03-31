require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/burger_controller')
require_relative('controllers/eatery_controller')

get '/' do
  erb(:index)
end
