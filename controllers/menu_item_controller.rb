require('sinatra')

get '/menu_item' do
  @burgers = Burger.all
  @eateries = Eatery.all
  erb(:"menu_items/menu_item")
end

post '/menu_item' do
  new_item = MenuItem.new(params)
  new_item.save
  @eatery = Eatery.find(params['eatery_id'])
  @menu_items = @eatery.menu_items
  erb(:"eateries/show_eatery")
end

get "/menu_item/delete" do
  @menu_items = MenuItem.all
  erb(:"menu_items/delete_menu_item")
end

post "/menu_item/delete" do
  menu_item = MenuItem.find(params['menu_item_id'])
  @eatery = Eatery.find(menu_item.eatery.id)
  @menu_items = @eatery.menu_items
  MenuItem.delete(params['menu_item_id'])
  erb(:"eateries/show_eatery")
end
