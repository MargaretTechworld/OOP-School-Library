def call_option(option)
  case option
  when 1
    list_books
  when 2
    list_people
  when 3
    create_person
  when 4
    create_book
  when 5
    create_rental
  when 6
    list_rentals
  else
    puts 'Choose a number between 1 and 7'
  end
end

def main
  app = App.new
  app.run
end