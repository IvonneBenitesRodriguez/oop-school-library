class Teacher < Person
  def initialize(specialization, *arguments)
    @specialization = specialization
    super(*arguments)
  end

  def can_use_services?
    true
  end

  def generate_string
    { specialization: @specialization, age: @age, name: @name, parent_permission: @parent_permission, id: @id,
      type: 'Teacher' }
  end

  def self.parse_string(arguments)
    new(arguments['specialization'], arguments['age'], arguments['name'],
        arguments['parent_permission'], arguments['id'])
  end

  def self.input_arguments
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    new(specialization, age, name)
  end
end
