class Message
  def self.welcome_message
    puts ''
    puts 'Welcome to School Library App!'
  end

  def self.display_options
    puts '..........................................'
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    puts 'Option: '
  end

  def self.close_message
    puts ''
    puts 'Thank you for using this app'
    puts ''
  end
end
