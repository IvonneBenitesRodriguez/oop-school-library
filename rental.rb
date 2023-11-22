# creating a class named Rental
class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def book=(book)
    @book = book
    book.add_rental(self)
  end

  def person=(person)
    @person = person
    person.add_rental(self)
  end

  def to_h
    {
      date: @date,
      book_title: @book.title,
      person_id: @person.id
    }
  end
end
