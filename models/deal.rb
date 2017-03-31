class Deal
  attr_reader :name, :id
  def initialize(data)
    @name = data['name']
    @id = nil || data['id'].to_i
    @menu_item_id = data['menu_item_id']
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

end
