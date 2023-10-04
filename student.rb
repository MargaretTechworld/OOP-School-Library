# frozen_string_literal: true

require_relative 'person'

# class for student
class Student < Person
  attr_accessor :classroom

  def initialize(id, age, classroom, name = 'unknown', parent_permission: true)
    super(id, age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky?
    "¯\(ツ)/¯"
  end
end

student1 = Student.new(1, 10, 'class', 'mag', parent_permission: false)
puts student1.parent_permission
