require_relative 'person'

# class for student
class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name,  parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky?
    '¯\(ツ)/¯'
  end

  def to_hash
    hash = super
    hash[:classroom] = @classroom
    hash
  end

  def self.from_hash(hash)
    new(
      hash['age'],
      hash['classroom'],
      hash['name'],
      parent_permission: hash['parent_permission']
    )
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
