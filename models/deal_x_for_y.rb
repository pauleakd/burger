require_relative('burger')
require_relative('eatery')

class DealXforY < Deal
  attr_reader :id, :x, :y, :day_id
  attr_accessor :menu_item_id, :id, :name
  def initialize(data)
    @name = data['name']
    @id = nil || data['id'].to_i
    @menu_item_id = data['menu_item_id'].to_i
    @day_id = data['day_id'].to_i
    @x = data['x'].to_i
    @y = data['y'].to_i
  end

  def save()
    sql = "INSERT INTO deals_x_for_y (name, menu_item_id, day_id, x, y)
    VALUES ('#{@name}', #{@menu_item_id}, #{@day_id}, #{@x}, #{@y})
    RETURNING id;"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def update()
      sql = "UPDATE deals_x_for_y SET name = '#{@name}',  menu_item_id = #{@menu_item_id},
       day_id = #{@day_id} , x = #{@x}, y= #{y}  WHERE id = #{id}"
      SqlRunner.run(sql)
    end

  def self.all()
    sql = "SELECT * FROM deals_x_for_y"
    result = SqlRunner.run(sql)
    deals = result.map{|deal| DealXforY.new(deal)}
    return deals
  end

  def self.delete_all()
    sql = "DELETE FROM deals_x_for_y"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM deals_x_for_y WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * from deals_x_for_y WHERE id = #{id}"
    result = SqlRunner.run(sql).first
    return DealXforY.new(result)
  end

  def burger_price
    sql = "SELECT menu_items.price FROM menu_items WHERE
    menu_items.id = #{@menu_item_id} "
    result = SqlRunner.run(sql).first
    return result['price'].to_f * @x
  end

  def calculate_savings()
    total_price = self.burger_price.to_f
    discount = (total_price / @x) * @y
    savings = total_price - discount
    return savings
  end

end
