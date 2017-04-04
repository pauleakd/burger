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

post '/deals/new_deal_regularp' do
  @new_deal = DealPercent.new(params)
  @new_deal.save
  redirect(:deals)
end

get '/deals/regulars' do
  @menu_items = MenuItem.all
  @days = Day.all
  erb(:new_deal_regulars)
end

post '/deals/new_deal_regulars' do
  @new_deal = DealSubtract.new(params)
  @new_deal.save
  redirect(:deals)
end

get '/deals/special' do
  @days = Day.all
  @menu_items = MenuItem.all
  erb(:new_deal_special)
end

post '/deals/new_deal_special' do
  @new_deal = DealXforY.new(params)
  @new_deal.save
  redirect(:deals)
end

post '/deals/delete/DealSubtract/:id' do
  id = params[:id]
  DealSubtract.delete(id)
  redirect '/deals'
end

post '/deals/delete/DealPercent/:id' do
  id = params[:id]
  DealPercent.delete(id)
  redirect '/deals'
end

post '/deals/delete/DealXforY/:id' do
  id = params[:id]
  DealXforY.delete(id)
  redirect '/deals'
end
