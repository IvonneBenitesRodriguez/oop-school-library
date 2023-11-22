
module SaveItemsToJson

    def save_books_data
    @save_books_data.save_data(@books.map(&:to_h))
    end

    def save_people_data
        @save_people_data.save_data(@people.map(&:to_h))
    end
    
    def save_rentals_data
        @save_rentals_data.save_data(@rentals.map(&:to_h))
    end    
end
