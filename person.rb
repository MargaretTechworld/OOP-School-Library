# frozen_string_literal: true

# class for person
class Person
  attr_accessor :id, :name, :age, :parent_permission

  def initialize(id, age, name = 'unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    return true if @age >= 18

    false
  end

  def can_use_services?
    return true if @age >= 18 || @parent_permission

    false
  end
end

person1 = Person.new(1, 15, 'John')
puts person1.name
puts person1.name = 'Mary'
person1.of_age?
person1.can_use_services?
