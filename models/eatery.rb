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
    sql = "SELECT DISTINCT deals.* FROM deals INNER JOIN menu_items ON menu_items.id = deals.menu_item_id
    WHERE menu_items.eatery_id = #{@id}"
    results = SqlRunner.run(sql)
    return results.map {|deal| Deal.new(deal)}
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
