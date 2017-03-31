require('pry')
require_relative('../models/burger')
require_relative('../models/eatery')
require_relative('../models/menu_item')
require_relative('../models/day')
require_relative('../models/deal')

MenuItem.delete_all
Burger.delete_all
Eatery.delete_all
Day.delete_all

monday = Day.new({'name' => "Monday"})
tuesday = Day.new({'name' => "Tuesday"})
wednesday = Day.new({'name' => "Wednesday"})
thursday = Day.new({'name' => "Thursday"})
friday = Day.new({'name' => "Friday"})
saturday = Day.new({'name' => "Saturday"})
sunday = Day.new({'name' => "Sunday"})

monday.save
tuesday.save
wednesday.save
thursday.save
friday.save
saturday.save
sunday.save

binding.pry

burger1 = Burger.new({'name' =>"Cheeseburger"})
burger1.save

eatery1 = Eatery.new({'name' => "Codeclan Bar"})
eatery1.save

menu_item1 = MenuItem.new({'burger_id' => burger1.id, 'eatery_id' => eatery1.id})
menu_item1.save

deal1 = Deal.new({
  'name' => "30% OFF",
  'menu_item_id' => menu_item1.id,
  'day_id' => monday.id
  })

deal1.save

binding.pry
nil
