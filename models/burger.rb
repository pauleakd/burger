require_relative('../db/sql_runner')

class Burger
  attr_reader :id, :name
  def initialize(data)
    @name = data['name']
    @id = nil || data['id'].to_i
  end

  def save()
    sql = "INSERT INTO burgers (name) VALUES ('#{@name}')
    RETURNING id;"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def eateries()
    sql = "SELECT distinct eateries.* FROM eateries INNER JOIN menu_items ON eateries.id = menu_items.eatery_id
    WHERE menu_items.burger_id = #{@id}"
    results = SqlRunner.run(sql)
    return results.map {|eatery| Eatery.new(eatery)}
  end

  def deals()

    sql = "SELECT distinct deals_subtract.* FROM deals_subtract
     INNER JOIN menu_items ON deals_subtract.menu_item_id= menu_items.id
    WHERE menu_items.burger_id = #{@id}"
    results = SqlRunner.run(sql)
    deals1 = results.map {|deal| DealSubtract.new(deal)}

    sql = "SELECT distinct deals_percent.* FROM deals_percent
     INNER JOIN menu_items ON deals_percent.menu_item_id= menu_items.id
    WHERE menu_items.burger_id = #{@id}"
    results = SqlRunner.run(sql)
    deals2 = results.map {|deal| DealPercent.new(deal)}

    sql = "SELECT distinct deals_x_for_y.* FROM deals_x_for_y
    INNER JOIN menu_items ON deals_x_for_y.menu_item_id= menu_items.id
    WHERE menu_items.burger_id = #{@id}"
    results = SqlRunner.run(sql)
    deals3 = results.map {|deal| DealXforY.new(deal)}

    return deals1 + deals2 + deals3
  end

  def self.all()
    sql = "SELECT * FROM burgers"
    result = SqlRunner.run(sql)
    burgers = result.map{|burger| Burger.new(burger)}
    return burgers
  end

  def self.delete_all()
    sql = "DELETE FROM burgers"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM burgers WHERE id = #{id}"
    result = SqlRunner.run(sql).first
    return Burger.new(result)
  end

  def self.delete(id)
    sql = "DELETE FROM burgers WHERE id = #{id}"
    SqlRunner.run(sql)
  end


end
