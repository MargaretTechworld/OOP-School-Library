# frozen_string_literal: true

require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'book'
require_relative 'classroom'
require_relative 'rental'

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

book = Book.new('Learn to code', 'Margaret Kojo-Musa')
person = Person.new(20, 'Abie Kojo-Musa')
rental = book.add_new_rental(person, '2023-10-06')

puts book.rentals.length
puts person.rentals.length
puts rental.book.title
puts rental.person.name
puts rental.date
