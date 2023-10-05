# class for person
class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permission:true)
    @id = Random.rand(1..1000)
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

person1 = Person.new(15, 'John')
puts person1.name
puts person1.name = 'Mary'
puts person1.of_age?
puts person1.can_use_services?
