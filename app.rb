require 'faker'
require './student'
require './classroom'
require './grade'
require './reportcard'
require 'pry'

# Our four classrooms for the first years
#below works
A = Classroom.new("1A")
B = Classroom.new("1B")
C = Classroom.new("1C")
D = Classroom.new("1D")


def gen_student()
  s = Student.new(Faker::Name::name, rand(1..25))  
  s.reportcard.add_grade(Grade.new("math", rand(0..100)))
  s.reportcard.add_grade(Grade.new("history", rand(0..100)))
  s.reportcard.add_grade(Grade.new("english", rand(0..100)))
  s.reportcard.add_grade(Grade.new("science", rand(0..100)))
  s
end

# Generate our students

(1..25).each do |i|
  A.add_student(gen_student())
end
1..25.times do |i|
  B.add_student(gen_student())
end
1..25.times do |i|
  C.add_student(gen_student())
end
1..25.times do |i|
  D.add_student(gen_student())
end

#Check the rosters

A.roster
puts ""
B.roster
puts ""
C.roster
puts ""
D.roster
puts ""


############################################################
# CHALLENGE 1

def find_failing(classroom)
  total = 0
  classroom.students.each do |key,value|
    value.reportcard.grades.each do |k,v|
      total = total + v.score
    end  
  end
    if total > 200
      puts "PASS"
    else
      puts "FAIL"
    end
end
find_failing A

############################################################
# CHALLENGE 2
def find_exceptional(classroom)
  total = 0  
  classroom.students.each do |key,value|
      value.reportcard.grades.map do |key, value|
        total = total + value.score
      end
      if total > 260
        puts total 
        puts "#{value.name}"
      end
    end   
end
find_exceptional B 

############################################################