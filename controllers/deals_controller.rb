require('sinatra')
require_relative('../models/deal')
require_relative('../models/deal_x_for_y')
require_relative('../models/deal_subtract')
require_relative('../models/deal_percent')
require_relative('../models/day')
require_relative('../models/menu_item')
require('pry')

get '/deals' do
  @deals = Deal.all
  erb(:deals)
end

get '/deals/new' do
  @menu_items = MenuItem.all
  erb(:new_deal)
end

post '/deals' do
  newlink = params[:deal_class]
  redirect "/deals/#{newlink}"
end

get '/deals/regularp' do
  @menu_items = MenuItem.all
  @days = Day.all
  erb(:new_deal_regularp)
end
