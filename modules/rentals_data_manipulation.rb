require 'json'

module RentalsDataManipulation
  def save_rentals_to_json(file_path, new_rental)
    parsed_data = []

    if File.exist?(file_path)
      current_data = File.read(file_path)
      parsed_data = JSON.parse(current_data) unless current_data.empty?
    end

    rental_data = {
      date: new_rental.date,
      person: {
        id: new_rental.person.id,
        name: new_rental.person.name,
        age: new_rental.person.age
      },
      book: {
        title: new_rental.book.title,
        author: new_rental.book.author
      }
    }

    parsed_data << rental_data

    File.write(file_path, JSON.pretty_generate(parsed_data))
  end

  def load_rentals_from_json(file_path)
    parsed_data = []

    if File.exist?(file_path)
      current_data = File.read(file_path)
      parsed_data = JSON.parse(current_data) unless current_data.empty?
    else
      # Create the directory and the file if they don't exist
      FileUtils.mkdir_p(File.dirname(file_path))
      File.write(file_path, [].to_json)
    end

    return [] if parsed_data.nil?

    parsed_data.map do |rental_data|
      person = Person.new(rental_data['person']['name'], rental_data['person']['age'], rental_data['person']['id'])
      book = Book.new(rental_data['book']['title'], rental_data['book']['author'])
      rental = Rental.new(rental_data['date'], book, person)
      rental
    end
  end
end
