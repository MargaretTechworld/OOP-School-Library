require_relative 'spec_helper'

describe Rental do
  before :each do
    person = Person.new(43, 'Remus Lupin')
    book = Book.new('Famous Werewolves', 'John Silverback')
    @rental = Rental.new('2023-10-10', book, person)
  end

  describe 'date' do
    it 'returns the correct date' do
      expect(@rental.date).to eql '2023-10-10'
    end
  end

  describe 'title' do
    it 'returns the correct title' do
      expect(@rental.book.title).to eql 'Famous Werewolves'
    end
  end

  describe 'name' do
    it 'returns the correct name' do
      expect(@rental.person.name).to eql 'Remus Lupin'
    end
  end
end
