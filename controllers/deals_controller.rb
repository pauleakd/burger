require('sinatra')
require_relative('../models/deal')

get '/deals' do
  @deals = Deal.all
  erb(:deals)
end
