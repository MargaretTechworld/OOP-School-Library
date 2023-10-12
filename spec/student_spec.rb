require_relative 'spec_helper'

describe Student do
  before :each do
    classroom = Classroom.new('Default Classroom')
    @student = Student.new(12, classroom, 'Harry Potter', parent_permission: true)
  end

  describe '#new' do
    it 'returns a new student object' do
      expect(@student).to be_an_instance_of Student
    end
  end

  describe 'age' do
    it 'returns the correct age' do
      expect(@student.age).to eql 12
    end
  end

  describe 'name' do
    it 'returns the correct name' do
      expect(@student.name).to eql 'Harry Potter'
    end
  end

  describe 'classroom' do
    it 'returns the correct name' do
      expect(@student.classroom.label).to eql 'Default Classroom'
    end
  end
end
