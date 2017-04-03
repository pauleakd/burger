require_relative('../db/sql_runner')

class Eatery
  attr_reader :id, :name
  def initialize(data)
    @name = data['name']
    @id = nil || data['id'].to_i
  end

  def save()
    sql = "INSERT INTO eateries (name) VALUES ('#{@name}')
    RETURNING id;"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def burgers()
    sql = "SELECT DISTINCT burgers.* from BURGERS INNER JOIN menu_items on menu_items.burger_id
    = burgers.id WHERE menu_items.eatery_id = #{@id}"
    results = SqlRunner.run(sql)
    return results.map {|burger| Burger.new(burger)}
  end

  def deals()
    sql = "SELECT DISTINCT deals_subtract.* FROM deals_subtract INNER JOIN menu_items
     ON menu_items.id = deals_subtract.menu_item_id
    WHERE menu_items.eatery_id = #{@id}"
    results = SqlRunner.run(sql)
    deals1 = results.map {|deal| DealSubtract.new(deal)}

    sql = "SELECT DISTINCT deals_percent.* FROM deals_percent INNER JOIN menu_items ON menu_items.id = deals_percent.menu_item_id
    WHERE menu_items.eatery_id = #{@id}"
    results = SqlRunner.run(sql)
    deals2 = results.map {|deal| DealPercent.new(deal)}

    sql = "SELECT DISTINCT deals_x_for_y.* FROM deals_x_for_y
     INNER JOIN menu_items ON menu_items.id = deals_x_for_y.menu_item_id
    WHERE menu_items.eatery_id = #{@id}"
    results = SqlRunner.run(sql)
    deals3 = results.map {|deal| DealXforY.new(deal)}

    return deals1 + deals2 + deals3
  end

  def self.all()
    sql = "SELECT * FROM eateries"
    result = SqlRunner.run(sql)
    eateries = result.map{|eatery| Eatery.new(eatery)}
    return eateries
  end

  def self.delete_all()
    sql = "DELETE FROM eateries"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM eateries WHERE id = #{id}"
    result = SqlRunner.run(sql).first
    return Eatery.new(result)
  end

end
