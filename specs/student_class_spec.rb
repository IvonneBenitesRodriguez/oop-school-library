require_relative '../student_class'

describe('Tests for methods inside Student class:') do
  it('Constructor should return a Student object.') do
    classroom = double('Classroom')
    allow(classroom).to(receive(:add_student))
    object = Student.new(classroom, 14, 'student')
    expect(object).to(be_an_instance_of(Student))
  end
  it('Method play_hooky should return a string shape.') do
    classroom = double('Classroom')
    allow(classroom).to(receive(:add_student))
    result = Student.new(classroom, 14).play_hooky
    expect(result).to(eq('¯\(ツ)/¯'))
  end
  it('Method generate_string should return a hash with instance variables of Student class.') do
    classroom = double('Classroom')
    allow(classroom).to(receive(:add_student))
    allow(classroom).to(receive(:label)).and_return('Math')
    allow(classroom).to(receive(:generate_string)).and_return({ label: 'Math' })
    result = Student.new(classroom, 14, 'student', false, 1).generate_string
    expected = { classroom: { label: 'Math' }, id: 1, age: 14, name: 'student', parent_permission: false,
                 type: 'Student' }

    expect(result).to(eq(expected))
  end
  it('Method parse_string should return a new Student object.') do
    arguments = { 'classroom' => { 'label' => 'label' }, 'age' => '14', 'name' => 'student' }
    object = Student.parse_string(arguments)
    expect(object).to(be_an_instance_of(Student))
  end
  it('Method input_arguments should return a new Student object.') do
    classroom = double('Classroom')
    allow(classroom).to(receive(:add_student))
    allow(classroom).to(receive(:label)).and_return('Math')
    allow(Student).to(receive(:gets)).and_return('14', 'student', 'n')
    allow($stdout).to(receive(:write))
    object = Student.input_arguments(classroom)
    expect(object).to(be_an_instance_of(Student))
  end
end
