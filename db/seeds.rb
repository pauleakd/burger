require('pry')
require_relative('../models/burger')
require_relative('../models/eatery')
require_relative('../models/menu_item')

MenuItem.delete_all
Burger.delete_all
Eatery.delete_all


burger1 = Burger.new({'name' =>"Cheeseburger"})
burger1.save

eatery1 = Eatery.new({'name' => "Codeclan Bar"})
eatery1.save

menu_item1 = MenuItem.new({'burger_id' => burger1.id, 'eatery_id' => eatery1.id})
menu_item1.save
binding.pry
nil
