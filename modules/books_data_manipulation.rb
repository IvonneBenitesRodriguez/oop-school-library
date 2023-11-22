require 'json'

module BooksDataManipulation
  def save_books_to_json(file_path, new_book)
    parsed_data = []

    if File.exist?(file_path)
      current_data = File.read(file_path)
      parsed_data = JSON.parse(current_data) unless current_data.empty?
    end

    book_data = {
      title: new_book.title,
      author: new_book.author
    }

    parsed_data << book_data

    File.write(file_path, JSON.pretty_generate(parsed_data))
  end

  def load_books_from_json(file_path)
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

    parsed_data.map do |book_data|
      book = Book.new(book_data['title'], book_data['author'])
      book
    end
  end
end
