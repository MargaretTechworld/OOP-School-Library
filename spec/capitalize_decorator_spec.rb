require_relative 'spec_helper'

describe CapitalizeDecorator do
  before :each do
    @nameable = double('Nameable', correct_name: 'mcgonagall')
    @decorator = CapitalizeDecorator.new(@nameable)
  end

  describe '#new' do
    it 'returns a new CapitalizeDecorator object' do
      expect(@decorator).to be_an_instance_of CapitalizeDecorator
    end
  end

  describe 'correct_name' do
    it 'returns capitalized name' do
      expect(@decorator.correct_name).to eql 'Mcgonagall'
    end
  end
end
