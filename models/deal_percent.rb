require_relative('burger')
require_relative('eatery')
require_relative('deal')

class DealPercent < Deal
  attr_reader :name, :id
  attr_accessor :menu_item_id

  def save()
    sql = "INSERT INTO deals_percent (name, menu_item_id, day_id, amount)
     VALUES ('#{@name}', #{@menu_item_id}, #{@day_id}, #{@amount})
    RETURNING id;"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def calculate_savings()
    price = self.burger_price
    savings = price.to_i * @amount.to_f
    return savings
  end

  def self.all()
    sql = "SELECT * FROM deals_percent"
    result = SqlRunner.run(sql)
    deals = result.map{|deal| DealPercent.new(deal)}
    return deals
  end

  def self.delete_all()
    sql = "DELETE FROM deals_percent"
    SqlRunner.run(sql)
  end


end
