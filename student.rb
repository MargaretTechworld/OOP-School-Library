require_relative 'person'

# class for student
class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky?
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end

student1 = Student.new('mag', 'CLASS', 10)
puts student1.of_age?
puts student1.can_use_services?
puts student1.name
puts student1.classroom
puts student1.age
