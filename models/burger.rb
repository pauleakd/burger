require_relative('../db/sql_runner')

class Burger
  def initialize(data)
    @name = data['name']
    @id = nil || data['id']
  end

  def save()
    sql = "INSERT INTO burgers (name) VALUES ('#{@name}')
    RETURNING id;"
    result = SqlRunner.run(sql)
    @id = result.first['id']
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

end
