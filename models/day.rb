require_relative('../db/sql_runner')

class Day
  attr_reader :id, :name
  def initialize(data)
    @name = data['name']
    @id = nil || data['id'].to_i
  end

  def save()
    sql = "INSERT INTO days (name) VALUES ('#{@name}')
    RETURNING id;"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end


  def self.all()
    sql = "SELECT * FROM days"
    result = SqlRunner.run(sql)
    days = result.map{|day| Day.new(day)}
    return days
  end

  def self.find_deals(id)
    sql = "SELECT * FROM deals_percent WHERE day_id = #{id}"
    results = SqlRunner.run(sql)
    deals = results.map {|deal| DealPercent.new(deal)}
    sql = "SELECT * FROM deals_subtract WHERE day_id = #{id}"
    results = SqlRunner.run(sql)
    deals2 = results.map {|deal| DealSubtract.new(deal)}
    sql = "SELECT * FROM deals_x_for_y WHERE day_id = #{id}"
    results = SqlRunner.run(sql)
    deals3 = results.map {|deal| DealXforY.new(deal)}
    return deals + deals2 + deals3
  end

  def self.delete_all()
    sql = "DELETE FROM days"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM days WHERE id = #{id}"
    result = SqlRunner.run(sql).first
    return Day.new(result)
  end

end
