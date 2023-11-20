require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'classroom'

require_relative 'modules/create_entities'
require_relative 'modules/list_entities'

class App
  include CreateEntities
  include ListEntities
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
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
    puts 'Exiting the application.Good bye!'
    exit
  end
end
