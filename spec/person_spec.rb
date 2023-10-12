require_relative 'spec_helper'

describe Person do
  before :each do
    @person = Person.new(12, 'Hermione')
  end

  describe '#new' do
    it 'returns a new person object' do
      expect(@person).to be_an_instance_of Person
    end
  end

  describe 'age' do
    it 'returns the correct age' do
      expect(@person.age).to eql 12
    end
  end

  describe 'name' do
    it 'returns the correct name' do
      expect(@person.name).to eql 'Hermione'
    end
  end
end