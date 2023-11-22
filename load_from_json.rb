module LoadFromJson
  def load_books_data
    books_data = @save_books_data.load_data
    return nil if books_data.nil?

    books_data.map do |book_data|
      book = Book.new(book_data['title'], book_data['author'])
      book
    end
  end

  def load_people_from_json
    people_data = @save_people_data.load_data
    return nil if people_data.nil?

    people_data.map do |person_data|
      person = Person.new(person_data['name'], person_data['age'], person_data['parent_permission'])
      person.id = person_data['id']
      person
    end
  end

  def load_rentals_from_json
    rentals_data = @save_rentals_data.load_data
    return nil if rentals_data.nil?

    rentals_data.map do |rental_data|
      rental = Rental.new(rental_data['date'], rental_data['book'], rental_data['person'])
      rental.id = rental_data['id']
      rental
    end
  end
end
