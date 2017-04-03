require('sinatra')
require_relative('../models/deal')
require_relative('../models/deal_x_for_y')
require_relative('../models/deal_subtract')
require_relative('../models/deal_percent')
require_relative('../models/day')
require('pry')

get '/deals' do
  @deals = Deal.all
  erb(:deals)
end
