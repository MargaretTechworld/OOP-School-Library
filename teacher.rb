# frozen_string_literal: true

require_relative 'person'

# class for teacher
class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name = 'unknown', parent_permission: false)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_hash
    hash = super
    hash[:specialization] = @specialization
    hash
  end

  def self.from_hash(hash)
    new(
      hash['age'],
      hash['specialization'],
      hash['name']
    )
  end
end
