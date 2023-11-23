class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.append(student) unless @students.include?(student)
  end

  def generate_string
    { label: @label }
  end

  def self.parse_string(arguments)
    new(arguments['label'])
  end
end
