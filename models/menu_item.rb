require_relative('../db/sql_runner')

class MenuItem
  attr_reader :id, :name
  def initialize(data)
    @burger_id = data['burger_id']
    @eatery_id = data['eatery_id']
    @id = nil || data['id'].to_i
  end

  def save()
    sql = "INSERT INTO menu_items (burger_id, eatery_id)
    VALUES ('#{@burger_id}', '#{@eatery_id}')
    RETURNING id;"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
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

end
