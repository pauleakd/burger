require('sinatra')

get '/menu_item' do
  @burgers = Burger.all
  @eateries = Eatery.all
  erb(:menu_item)
end

post '/menu_item' do
  new_item = MenuItem.new(params)
  new_item.save
  @eatery = Eatery.find(params['eatery_id'])
  erb(:show_eatery)
end
