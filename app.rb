# frozen_string_literal: true

require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'data_manager'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @rentals = []
    @people = []
    load_people('data/people.json')
    load_books('data/books.json')
    load_rental('data/rentals.json')
  end

  # Lists all books
  def list_books
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  # Lists all books with index
  def list_books_with_index
    @books.each_with_index { |book, i| puts "#{i}) Title: \"#{book.title}\", Author: #{book.author}" }
  end

  # Lists all people
  def list_people
    @people.each do |person|
      puts "[#{person.class.name}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
    end
  end

  # Lists all people with index
  def list_people_with_index
    @people.each_with_index do |person, i|
      puts "#{i}) [#{person.class.name}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
    end
  end

  # Creates a new person (student or teacher)
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    student_or_teacher = gets.chomp.to_i
    if student_or_teacher == 1
      create_student
    elsif student_or_teacher == 2
      create_teacher
    else
      puts "Error: option has an invalid value (#{student_or_teacher})"
    end
  end

  # Creates a new student
  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_s
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.to_s
    if parent_permission =~ /^[Yy]/
      student = Student.new(age, 'unknown', name, parent_permission: true)
    elsif parent_permission =~ /^[Nn]/
      student = Student.new(age, 'unknown', name, parent_permission: false)
    else
      puts "Error: option has an invalid value (#{parent_permission})"
      return
    end

    @people.push(student)
    puts 'Person created successfully'
    save_people('data/people.json')
  end

  # Creates a new teacher
  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp.to_s

    print 'Specialization: '
    specialization = gets.chomp.to_s

    teacher = Teacher.new(age, specialization, name)
    @people.push(teacher)
    puts 'Person created successfully'
    save_people('data/people.json')
  end

  # Creates a new book
  def create_book
    print 'Title: '
    title = gets.chomp.to_s

    print 'Author: '
    author = gets.chomp.to_s

    @books.push(Book.new(title, author))
    puts 'Book created successfully'
    save_books('data/books.json')
  end

  # Creates a new rental
  def create_rental
    puts 'Select a book from the following list by number'
    list_books_with_index
    book_index = gets.chomp.to_i
    unless (0...@books.length).include?(book_index)
      puts "Can not add a record. Book #{book_index} doesn't exist"
      return
    end

    book = @books[book_index]
    puts "\nSelect a person from the following list by number (not id)"
    list_people_with_index
    person_index = gets.chomp.to_i
    unless (0...@people.length).include?(person_index)
      puts "Can not add a record. Person #{person_index} doesn't exist"
      return
    end

    person = @people[person_index]
    print 'Date: '
    date = gets.chomp.to_s
    @rentals.push(Rental.new(date, book, person))
    puts 'Rental created successfully'
    save_rental('data/rentals.json')
  end

  # Lists rentals for a given person ID
  def list_rentals
    puts 'Enter the person ID:'
    person_id = gets.chomp.to_i

    rentals_found = false

    @rentals.each do |rental|
      if rental.person.id == person_id
        rentals_found = true
        puts " Person ID: #{rental.person.id} \n Date: #{rental.date},\n Book: #{rental.book.title} by #{rental.book.author}"
      end
    end

    return if rentals_found

    puts "No rentals found for person with ID #{person_id}"
  end

  def run
    prompt
  end
end
