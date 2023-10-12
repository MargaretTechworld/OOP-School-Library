# frozen_string_literal: true

require_relative 'student'
require_relative 'teacher'
require 'json'

def save_people(filename)
  data = @people.map(&:to_hash)
  save_data(filename, data, 'People')
end

def load_people(filename)
  return unless File.exist?(filename)

  data = File.read(filename)
  people_data = JSON.parse(data)
  @people = people_data.map do |person_data|
    if person_data['classroom']
      Student.from_hash(person_data)
    else
      Teacher.from_hash(person_data)
    end
  end
  puts "People data loaded from #{filename}"
end

def save_books(filename)
  data = @books.map(&:to_hash)
  save_data(filename, data, 'Books')
end

def load_books(filename)
  return unless File.exist?(filename)

  data = File.read(filename)
  book_data = JSON.parse(data)
  @books = book_data.map do |book_data_item|
    Book.from_hash(book_data_item)
  end
  puts "Book data loaded from #{filename}"
end


