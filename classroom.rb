

class Classroom
  attr_accessor :name, :students
   

  def initialize(name)
    @name = name
    @students = {}
  end

  def add_student(student)
    if @students[student.name] 
      raise "Sorry, #{student.name} is already in here."
    end
    @students[student.name] = student
  end

  def roster
    puts @name + " roster:"
    @students.each do |key, value|  
      puts "#{value.name}: #{value.age}"
    end
  end

end
