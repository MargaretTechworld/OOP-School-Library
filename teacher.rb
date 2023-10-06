# frozen_string_literal: true

require_relative 'person'

# class for teacher
class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'unknown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher1 = Teacher.new(20, 'dd', 'hjj')
puts teacher1.id
