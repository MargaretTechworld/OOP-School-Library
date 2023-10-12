require_relative 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new(43, 'Potions', 'Severus Snape', parent_permission: true)
  end

  describe '#new' do
    it 'returns a new teacher object' do
      expect(@teacher).to be_an_instance_of Teacher
    end
  end

  describe 'age' do
    it 'returns the correct age' do
      expect(@teacher.age).to eql 43
    end
  end

  describe 'specialization' do
    it 'returns the correct specialization' do
      expect(@teacher.specialization).to eql 'Potions'
    end
  end

  describe 'name' do
    it 'returns the correct name' do
      expect(@teacher.name).to eql 'Severus Snape'
    end
  end
end
