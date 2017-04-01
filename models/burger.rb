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
    sql = ""

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



end
