# Renntal  class
class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    @book.rentals << self
    @person.rentals << self
  end

  def to_hash
    {
      date: @date,
      book: @book.to_hash,
      person: @person.to_hash
    }
  end

  def self.from_hash(hash)
    book = Book.from_hash(hash['book'])
    person = Person.from_hash(hash['person'])
    new(hash['date'], book, person)
  end
end
