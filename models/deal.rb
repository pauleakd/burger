require_relative('burger')
require_relative('eatery')


class Deal
  attr_reader :name, :id
  attr_accessor :menu_item_id
  def initialize(data)
    @name = data['name']
    @id = nil || data['id'].to_i
    @menu_item_id = data['menu_item_id'].to_i
    @day_id = data['day_id'].to_i
    @amount = data['amount']
  end

  # def save()
  #   sql = "INSERT INTO deals (name, menu_item_id, day_id, amount)
  #    VALUES ('#{@name}', #{@menu_item_id}, #{@day_id}, #{@amount})
  #   RETURNING id;"
  #   result = SqlRunner.run(sql)
  #   @id = result.first['id'].to_i
  # end

  def update(table)
    sql = "UPDATE #{table} SET name = '#{@name}',  menu_item_id = #{@menu_item_id},
     day_id = #{@day_id} , amount = #{@amount}  WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def burger()
    sql = "SELECT burgers.* FROM burgers INNER JOIN menu_items
     ON menu_items.burger_id = burgers.id WHERE
     menu_items.id = #{@menu_item_id} "
     result = SqlRunner.run(sql).first
     burger = Burger.new(result)
     return burger
  end

  def eatery()
    sql = "SELECT eateries.* FROM eateries INNER JOIN menu_items
     ON menu_items.eatery_id = eateries.id WHERE
     menu_items.id = #{@menu_item_id} "
     result = SqlRunner.run(sql).first
    eatery = Eatery.new(result)
     return eatery
  end

  def day()
    sql = "SELECT days.name FROM days WHERE id = #{@day_id}"
    result = SqlRunner.run(sql).first
    day = Day.new(result)
    return day
  end

  def burger_price
    sql = "SELECT menu_items.price FROM menu_items WHERE
    menu_items.id = #{@menu_item_id} "
    result = SqlRunner.run(sql).first
    return result['price'].to_f
  end

  def self.all()
    sql = "SELECT * FROM deals_x_for_y"
    result = SqlRunner.run(sql)
    deals = result.map{|deal| DealXforY.new(deal)}
    sql = "SELECT * FROM deals_percent"
    result = SqlRunner.run(sql)
    deals2 = result.map{|deal| DealPercent.new(deal)}
    sql = "SELECT * FROM deals_subtract"
    result = SqlRunner.run(sql)
    deals3 = result.map{|deal| DealSubtract.new(deal)}
    return deals + deals2 + deals3
  end



end
