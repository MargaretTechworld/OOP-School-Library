# class for book
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_new_rental(person, date)
    Rental.new(date, self, person)
  end

  def to_hash
    {
      title: @title,
      author: @author
    }
  end

  def self.from_hash(hash)
    new(
      hash['title'],
      hash['author']
    )
  end
end
