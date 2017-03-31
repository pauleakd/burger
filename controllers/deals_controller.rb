require('sinatra')
require_relative('../models/deal')
require('pry')

get '/deals' do
  @deals = Deal.all
  erb(:deals)
end
