require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'classroom'
require_relative 'storage'
require_relative 'save_to_json'
require_relative  'load_from_json'

require_relative 'modules/create_entities'
require_relative 'modules/list_entities'


class App
  include CreateEntities
  include ListEntities
  include SaveItemsToJson
  include LoadFromJson

  attr_accessor :books, :people, :rentals

  def initialize
    @save_books_data = SaveData.new("db/books.json")
    @save_people_data = SaveData.new("db/people.json")
    @save_rentals_data = SaveData.new("db/rentals.json")
    @books = load_books_data || []
    @people = load_people_from_json || []
    @rentals = load_rentals_from_json || []
  end

  def create_person
    person = super
    @people << person
  end

  def create_book
    book = super
    @books << book
  end

  def create_rental
    rental = super(@books, @people)
    @rentals << rental
  end

  def exit_app
    save_books_data
    save_people_data
    save_rentals_data
    puts 'Exiting the application.Good bye!'
    exit
  end
end
