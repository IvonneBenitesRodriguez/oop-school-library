require_relative '../classroom_class'

describe('Tests for methods inside Classroom class:') do
  before :all do
    @object = Classroom.new('label')
  end
  it('Constructor should return a Classroom object.') do
    expect(@object).to(be_an_instance_of(Classroom))
  end
  it('Method add_student should add Student object to students array inside Classroom class.') do
    student = double('Student')
    @object.add_student(student)
    expect(@object.students).to(include(student))
  end
  it('Method generate_string should return a hash with instance variables of Classroom class.') do
    expected = { label: 'label' }
    result = @object.generate_string
    expect(result).to(eq(expected))
  end
  it('Method parse_string should return a new Classroom object.') do
    arguments = { 'label' => 'label' }
    object = Classroom.parse_string(arguments)
    expect(object).to(be_an_instance_of(Classroom))
  end
end
