require './reportcard'
class Student

  def initialize(name, age)
    @name = name
    @age = age
    @reportcard = Reportcard.new
  end
end
