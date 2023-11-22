require 'json'

module PeopleDataManipulation
  def save_people_to_json(file_path, new_person)
    parsed_data = []

    if File.exist?(file_path)
      current_data = File.read(file_path)
      parsed_data = JSON.parse(current_data) unless current_data.empty?
    end

    person_data = {
      id: new_person.id,
      name: new_person.name,
      age: new_person.age
    }

    parsed_data << person_data

    File.write(file_path, JSON.pretty_generate(parsed_data))
  end

#   def load_people_from_json(file_path)
#     if File.exist?(file_path)
#       current_data = File.read(file_path)
#       parsed_data = JSON.parse(current_data) unless current_data.empty?
#       return [] if parsed_data.nil?
#     end

#     parsed_data.map do |person_data|
#       person = Person.new(person_data['name'], person_data['age'], person_data['id'])
#       person
#     end
#   end
end
