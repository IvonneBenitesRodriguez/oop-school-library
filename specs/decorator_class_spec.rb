require_relative '../nameable_class'
require_relative '../decorator_class'

describe('Tests for methods inside Decorator class:') do
  before :each do
    person = double('Person')
    allow(person).to(receive(:correct_name)).and_return('string')
    @object = Decorator.new(person)
  end
  it('Constructor should return a Decorator object.') do
    expect(@object).to(be_an_instance_of(Decorator))
  end
  it('Method correct_name should return same string unchanged.') do
    expect(@object.correct_name).to(eq('string'))
  end
end
