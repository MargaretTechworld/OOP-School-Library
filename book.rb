# frozen_string_literal: true

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
end
