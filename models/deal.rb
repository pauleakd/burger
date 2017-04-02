class Deal
  attr_reader :name, :id
  attr_accessor :menu_item_id
  def initialize(data)
    @name = data['name']
    @id = nil || data['id'].to_i
    @menu_item_id = data['menu_item_id'].to_i
    @day_id = data['day_id'].to_i
  end

  def save()
    sql = "INSERT INTO deals (name, menu_item_id, day_id)
     VALUES ('#{@name}', #{@menu_item_id}, #{@day_id})
    RETURNING id;"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM deals"
    result = SqlRunner.run(sql)
    deals = result.map{|deal| Deal.new(deal)}
    return deals
  end

  def self.delete_all()
    sql = "DELETE FROM deals"
    SqlRunner.run(sql)
  end

  def burger()
    sql = "SELECT burgers.* FROM burgers INNER JOIN menu_items
     ON menu_items.burger_id = burgers.id WHERE
     menu_items.id = #{@menu_item_id} "
     result = SqlRunner.run(sql)
     burger = Burger.new(burger)
     return burger
  end

  def eatery()
    sql = "SELECT eateries.name FROM eateries INNER JOIN menu_items
     ON menu_items.eatery_id = eateries.id WHERE
     menu_items.id = #{@menu_item_id} "
     result = SqlRunner.run(sql)
    eatery = result.first['name']
     return eatery
  end

  def day()
    sql = "SELECT days.name FROM days WHERE id = #{@day_id}"
    result = SqlRunner.run(sql)
    day = result.first['name']
  end
end
