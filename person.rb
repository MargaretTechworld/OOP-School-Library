# frozen_string_literal: true

require_relative 'nameable'

# class for person
class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end

  def add_new_rental(book, date)
    @rentals << Rental.new(date, book, self)
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    @age >= 18 || @parent_permission
  end

  def correct_name
    @name
  end
end

person1 = Person.new(15, 'John')
puts person1.name
puts person1.name = 'Mary'
puts person1.of_age?
puts person1.can_use_services?
puts person1.correct_name
