class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.add_rental(self)
    person.add_rental(self)
  end

  def generate_string
    { date: @date, book: @book.generate_string, person: @person.generate_string }
  end

  def self.parse_string(arguments)
    if arguments['person']['type'] == 'Student'
      new(arguments['date'], Book.parse_string(arguments['book']), Student.parse_string(arguments['person']))
    elsif arguments['person']['type'] == 'Teacher'
      new(arguments['date'], Book.parse_string(arguments['book']), Teacher.parse_string(arguments['person']))
    end
  end

  def self.input_arguments(book, person)
    print 'Date: '
    date = gets.chomp
    new(date, book, person)
  end
end
