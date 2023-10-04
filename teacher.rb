require_relative 'person'

# class for teacher
class Teacher < Person
  attr_accessor :specialization

  def initialize(id, age, specialization, name = 'unknown', parent_permission: true)
    super(id, age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher1 = Teacher.new(1, 20, 'dd', 'hjj', parent_permission: false)
puts teacher1.can_use_services?
