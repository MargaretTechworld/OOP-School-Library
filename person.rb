# frozen_string_literal: true

require_relative 'nameable'

# class for person
class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  @count = 1
  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = self.class.next_id
    @name = name
    @age = age.to_i
    @parent_permission = parent_permission
    @rentals = []
  end

  def self.next_id
    @count ||= 1
    @count += 1
    @count - 1
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

  def to_hash
    {
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission
    }
  end

  def self.from_hash(hash)
    new(
      hash['age'],
      hash['name'],
      parent_permission: hash['parent_permission']
    )
  end
end
