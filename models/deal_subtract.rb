require_relative('burger')
require_relative('eatery')
require_relative('deal')

class DealSubtract < Deal
  attr_reader :id, :amount, :day_id, :name
  attr_accessor :menu_item_id, :name

  def save()
    sql = "INSERT INTO deals_subtract (name, menu_item_id, day_id, amount)
     VALUES ('#{@name}', #{@menu_item_id}, #{@day_id}, #{@amount})
    RETURNING id;"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def calculate_savings()
    savings = @amount
    return savings.to_f
  end

  def self.all()
    sql = "SELECT * FROM deals_subtract"
    result = SqlRunner.run(sql)
    deals = result.map{|deal| DealSubtract.new(deal)}
    return deals
  end

  def self.delete_all()
    sql = "DELETE FROM deals_subtract"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM deals_subtract WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * from deals_subtract WHERE id = #{id}"
    result = SqlRunner.run(sql).first
    return DealSubtract.new(result)
  end

end
