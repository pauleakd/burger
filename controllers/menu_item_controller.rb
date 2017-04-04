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

get "/menu_item/delete" do
  @menu_items = MenuItem.all
  erb(:delete_menu_item)
end

post "/menu_item/delete" do
  menu_item = MenuItem.find(params['menu_item_id'])
  @eatery = Eatery.find(menu_item.eatery.id)
  MenuItem.delete(params['menu_item_id'])
  erb(:show_eatery)
end
