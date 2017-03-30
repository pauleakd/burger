require('pry')
require_relative('../models/burger')

burger1 = Burger.new("Cheeseburger")
burger1.save

binding.pry
nil
