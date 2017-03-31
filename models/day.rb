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

  def self.delete_all()
    sql = "DELETE FROM days"
    SqlRunner.run(sql)
  end

end
