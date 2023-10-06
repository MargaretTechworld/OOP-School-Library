# frozen_string_literal: true

require_relative 'person'

# class for student
class Student < Person
  attr_accessor :classroom

  def initialize(classroom)
    super(name, age, parent_permission: true)
    @classroom = classroom
  end

  def play_hooky?
    '¯\(ツ)/¯'
  end
end

student1 = Student.new(10, 'class', 'mag')
puts student1.of_age?
puts student1.can_use_services?
