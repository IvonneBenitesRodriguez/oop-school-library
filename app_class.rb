require_relative 'nameable_class'
require_relative 'decorator_class'
require_relative 'capitalize_class'
require_relative 'trimmer_class'
require_relative 'person_class'
require_relative 'student_class'
require_relative 'teacher_class'
require_relative 'classroom_class'
require_relative 'book_class'
require_relative 'rental_class'
require_relative 'storage_module'

class App
  include Storage

  def initialize
    read_books
    read_people
    read_rentals
    @classroom = Classroom.new('Math')
  end

  def handle_option(option)
    case option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      people_option
    when '4'
      create_book
    when '5'
      handle_rental
    when '6'
      list_rentals
    else
      puts 'Wrong number! Try again'
    end
  end

  def people_option
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    number = gets.chomp
    case number
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Wrong number! Try again'
      people_option
    end
  end

  def list_books(indexed = false)
    return puts 'No available books!' if @books.empty?

    puts 'Select a book from the following list by number' if indexed
    index = 0
    @books.each do |book|
      print "#{index}) " if indexed
      puts "Title: \"#{book.title}\", Author: #{book.author}"
      index += 1
    end
  end

  def list_people(indexed = false)
    return puts 'No available people!' if @people.empty?

    puts 'Select a person from the following list by number (not id)' if indexed
    index = 0
    @people.each do |person|
      print "#{index}) " if indexed
      puts "[#{person.class}] Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
      index += 1
    end
  end

  def create_student
    @people.append(Student.input_arguments(@classroom))
    puts 'Person created successfully'
  end

  def create_teacher
    @people.append(Teacher.input_arguments)
    puts 'Person created successfully'
  end

  def create_book
    @books.append(Book.input_arguments)
    puts 'Book created successfully'
  end

  def handle_rental
    list_books(true)
    book = gets.chomp.to_i
    list_people(true)
    people = gets.chomp.to_i
    create_rental(book, people)
  end

  def create_rental(book, person)
    @rentals.append(Rental.input_arguments(@books[book], @people[person]))
    puts 'Rental created successfully'
  end

  def list_rentals
    puts 'No available rentals!' if @rentals.empty?
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
  end

  def read_books
    @books = []
    books = read_file('books.json')
    books.each { |book| @books.append(Book.parse_string(book)) }
  end

  def read_people
    @people = []
    people = read_file('people.json')
    people.each do |person|
      @people.append(Student.parse_string(person)) if person['type'] == 'Student'
      @people.append(Teacher.parse_string(person)) if person['type'] == 'Teacher'
    end
  end

  def read_rentals
    @rentals = []
    rentals = read_file('rentals.json')
    rentals.each { |rental| @rentals.append(Rental.parse_string(rental)) }
  end

  def close_app
    write_file('books.json', @books)
    write_file('people.json', @people)
    write_file('rentals.json', @rentals)
  end
end
