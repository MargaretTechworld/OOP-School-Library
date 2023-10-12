require_relative 'spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Potions Classroom')
  end

  describe '#new' do
    it 'returns a new classroom object' do
      expect(@classroom).to be_an_instance_of Classroom
    end
  end

  describe 'label' do
    it 'returns the correct label' do
      expect(@classroom.label).to eql 'Potions Classroom'
    end
  end
end