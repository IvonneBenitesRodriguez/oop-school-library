require_relative '../teacher_class'

describe('Tests for methods inside Teacher class:') do
  it('Constructor should return a Teacher object.') do
    expect(Teacher.new('Math', 44, 'teacher')).to(be_an_instance_of(Teacher))
  end
  it('Method can_use_services should always return true.') do
    expect(Teacher.new('Math', 44, 'teacher').can_use_services?).to(eq(true))
  end
  it('Method generate_string should return a hash with instance variables of Teacher class.') do
    expected = { specialization: 'Math', id: 1, age: 44, name: 'teacher', parent_permission: true, type: 'Teacher' }
    result = Teacher.new('Math', 44, 'teacher', true, 1).generate_string
    expect(result).to(eq(expected))
  end
  it('Method parse_string should return a new Teacher object.') do
    arguments = { 'specialization' => 'label', 'age' => '44', 'name' => 'teacher' }
    object = Teacher.parse_string(arguments)
    expect(object).to(be_an_instance_of(Teacher))
  end
  it('Method input_arguments should return a new Teacher object.') do
    allow(Teacher).to(receive(:gets)).and_return('44', 'teacher', 'Math')
    allow($stdout).to(receive(:write))
    object = Teacher.input_arguments
    expect(object).to(be_an_instance_of(Teacher))
  end
end
