require_relative('../db/sql_runner')

class MenuItem
  attr_reader :id, :name
  def initialize(data)
    @burger_id = data['burger_id'].to_i
    @eatery_id = data['eatery_id'].to_i
    @id = nil || data['id'].to_i
    @price = data['price'].to_f
  end

  def save()
    sql = "INSERT INTO menu_items (burger_id, eatery_id, price)
    VALUES ('#{@burger_id}', '#{@eatery_id}', '#{@price}')
    RETURNING id;"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def burger()
    sql = "SELECT * FROM burgers WHERE id = #{@burger_id}"
    result = SqlRunner.run(sql).first
    return Burger.new(result)
  end

    def eatery()
      sql = "SELECT * FROM eateries WHERE id = #{@eatery_id}"
      result = SqlRunner.run(sql).first
      return Eatery.new(result)
    end

  def self.all()
    sql = "SELECT * FROM menu_items"
    result = SqlRunner.run(sql)
    menu_items = result.map{|menu_item| MenuItem.new(menu_item)}
    return menu_items
  end

  def self.delete_all()
    sql = "DELETE FROM menu_items"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM menu_items WHERE id = #{id}"
    SqlRunner.run(sql)
  end

end
