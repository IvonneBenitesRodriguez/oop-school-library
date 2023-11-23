class Student < Person
  attr_reader :classroom

  def initialize(classroom, *arguments)
    @classroom = classroom
    classroom.add_student(self)
    super(*arguments)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def generate_string
    { classroom: @classroom.generate_string, age: @age, name: @name, parent_permission: @parent_permission, id: @id,
      type: 'Student' }
  end

  def self.parse_string(arguments)
    new(Classroom.parse_string(arguments['classroom']), arguments['age'], arguments['name'],
        arguments['parent_permission'], arguments['id'])
  end

  def self.input_arguments(classroom)
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.upcase == 'Y'
    new(classroom, age, name, parent_permission)
  end
end
