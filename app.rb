require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'classroom'

require_relative 'modules/create_entities'
require_relative 'modules/list_entities'
require_relative 'modules/people_data_manipulation'
require_relative 'modules/books_data_manipulation'
require_relative 'modules/rentals_data_manipulation'

RENTALS_PATH = './db/rentals.json'.freeze
PEOPLE_PATH = './db/people.json'.freeze
BOOKS_PATH = './db/books.json'.freeze

class App
  include CreateEntities
  include ListEntities
  include RentalsDataManipulation
  include PeopleDataManipulation
  include BooksDataManipulation

  attr_accessor :books, :people, :rentals

  def initialize
    @books = load_books_from_json(BOOKS_PATH)
    @people = load_people_from_json(PEOPLE_PATH)
    @rentals = load_rentals_from_json(RENTALS_PATH)
  end

  def create_person
    person = super
    @people << person

    save_people_to_json(PEOPLE_PATH, person)
  end

  def create_book
    book = super
    @books << book
    save_books_to_json(BOOKS_PATH, book)
  end

  def create_rental
    rental = super(@books, @people)
    @rentals << rental
    save_rentals_to_json(RENTALS_PATH, rental)
  end

  def exit_app
    puts 'Exiting the application.Good bye!'
    exit
  end
end
