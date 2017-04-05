require('pry')
require_relative('../models/burger')
require_relative('../models/eatery')
require_relative('../models/menu_item')
require_relative('../models/day')
require_relative('../models/deal')
require_relative('../models/deal_subtract')
require_relative('../models/deal_percent')
require_relative('../models/deal_x_for_y')

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
burger4 = Burger.new({'name' =>"Chicken Burger"})
burger5 = Burger.new({'name' =>"Sausage Burger"})
burger1.save
burger2.save
burger3.save
burger4.save
burger5.save

eatery1 = Eatery.new({'name' => "Codeclan Bar"})
eatery2 = Eatery.new({'name' => "McDonalds"})
eatery3 = Eatery.new({'name' => "Hippie Bar"})
eatery4 = Eatery.new({'name' => "Burger King"})
eatery5 = Eatery.new({'name' => "Sunshine Land"})
eatery1.save
eatery2.save
eatery3.save
eatery4.save
eatery5.save

menu_item1 = MenuItem.new({'burger_id' => burger1.id, 'eatery_id' => eatery3.id, 'price' => 5})
menu_item2 = MenuItem.new({'burger_id' => burger2.id, 'eatery_id' => eatery1.id, 'price' => 3})
menu_item3 = MenuItem.new({'burger_id' => burger3.id, 'eatery_id' => eatery2.id, 'price' => 9})
menu_item4 = MenuItem.new({'burger_id' => burger2.id, 'eatery_id' => eatery3.id, 'price' => 6})
menu_item5 = MenuItem.new({'burger_id' => burger5.id, 'eatery_id' => eatery1.id, 'price' => 8})
menu_item5 = MenuItem.new({'burger_id' => burger4.id, 'eatery_id' => eatery3.id, 'price' => 5})
menu_item6 = MenuItem.new({'burger_id' => burger4.id, 'eatery_id' => eatery2.id, 'price' => 5})
menu_item7 = MenuItem.new({'burger_id' => burger3.id, 'eatery_id' => eatery1.id, 'price' => 5})
menu_item7 = MenuItem.new({'burger_id' => burger2.id, 'eatery_id' => eatery4.id, 'price' => 5})
menu_item8 = MenuItem.new({'burger_id' => burger3.id, 'eatery_id' => eatery5.id, 'price' => 10})
menu_item9 = MenuItem.new({'burger_id' => burger1.id, 'eatery_id' => eatery4.id, 'price' => 15})
menu_item10 = MenuItem.new({'burger_id' => burger5.id, 'eatery_id' => eatery5.id, 'price' => 6})
menu_item11 = MenuItem.new({'burger_id' => burger4.id, 'eatery_id' => eatery3.id, 'price' => 5})
menu_item1.save
menu_item2.save
menu_item3.save
menu_item4.save
menu_item5.save
menu_item6.save
menu_item7.save
menu_item8.save
menu_item9.save
menu_item10.save
menu_item11.save


# deal1 = Deal.new({
#   'name' => "10% OFF",
#   'menu_item_id' => menu_item1.id,
#   'day_id' => monday.id
#   })
#   deal2 = Deal.new({
#     'name' => "£5 OFF",
#     'menu_item_id' => menu_item3.id,
#     'day_id' => tuesday.id
#     })
#   deal3 = Deal.new({
#     'name' => "20% OFF",
#     'menu_item_id' => menu_item4.id,
#     'day_id' => monday.id
#     })
#   deal4 = Deal.new({
#     'name' => "30% OFF",
#     'menu_item_id' => menu_item2.id,
#     'day_id' => saturday.id
#     })
#   deal5 = Deal.new({
#     'name' => "30% OFF",
#     'menu_item_id' => menu_item7.id,
#     'day_id' => friday.id
#     })

# deal1.save
# deal2.save
# deal3.save
# deal4.save
# deal5.save

deal1 = DealSubtract.new({
    'name' => "£1 OFF",
    'menu_item_id' => menu_item2.id,
    'day_id' => saturday.id,
    'amount' => 1
    })
deal2 = DealPercent.new({
    'name' => "30% OFF",
    'menu_item_id' => menu_item5.id,
    'day_id' => monday.id,
    'amount' => 0.3
    })
deal3 = DealPercent.new({
    'name' => "10% OFF",
    'menu_item_id' => menu_item6.id,
    'day_id' => monday.id,
    'amount' => 0.1
      })

deal4 = DealXforY.new({
    'name' => "2 for 1",
    'menu_item_id' => menu_item7.id,
    'day_id' => tuesday.id,
    'x' => 2,
    'y' => 1
    });
deal7= DealXforY.new({
    'name' => "3 for 2",
    'menu_item_id' => menu_item9.id,
    'day_id' => friday.id,
    'x' => 3,
    'y' => 2
    });
deal5 = DealPercent.new({
    'name' => "30% OFF",
    'menu_item_id' => menu_item11.id,
    'day_id' => monday.id,
    'amount' => 0.3
      });
  deal6 = DealSubtract.new({
    'name' => "£3 OFF",
    'menu_item_id' => menu_item8.id,
    'day_id' => tuesday.id,
    'amount' => 3
    })

deal1.save
deal2.save
deal3.save
deal4.save
deal5.save
deal6.save
deal7.save
