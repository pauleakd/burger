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

burger1 = Burger.new({'name' =>"Cheeseburger"})
burger2 = Burger.new({'name' =>"Hamburger"})
burger3 = Burger.new({'name' =>"Veggie Burger"})
burger1.save
burger2.save
burger3.save

eatery1 = Eatery.new({'name' => "Codeclan Bar"})
eatery3 = Eatery.new({'name' => "McDonalds"})
eatery2 = Eatery.new({'name' => "Hippie Bar"})
eatery1.save
eatery2.save
eatery3.save

menu_item1 = MenuItem.new({'burger_id' => burger1.id, 'eatery_id' => eatery3.id})
menu_item2 = MenuItem.new({'burger_id' => burger2.id, 'eatery_id' => eatery1.id})
menu_item3 = MenuItem.new({'burger_id' => burger3.id, 'eatery_id' => eatery2.id})
menu_item4 = MenuItem.new({'burger_id' => burger2.id, 'eatery_id' => eatery1.id})
menu_item1.save
menu_item2.save
menu_item3.save
menu_item4.save

deal1 = Deal.new({
  'name' => "30% OFF",
  'menu_item_id' => menu_item1.id,
  'day_id' => monday.id
  })
  deal2 = Deal.new({
    'name' => "£5 OFF",
    'menu_item_id' => menu_item3.id,
    'day_id' => tuesday.id
    })
    deal3 = Deal.new({
      'name' => "30% OFF",
      'menu_item_id' => menu_item4.id,
      'day_id' => monday.id
      })
      deal4 = Deal.new({
        'name' => "30% OFF",
        'menu_item_id' => menu_item2.id,
        'day_id' => saturday.id
        })

deal1.save
deal2.save
deal3.save
deal4.save

binding.pry
nil
