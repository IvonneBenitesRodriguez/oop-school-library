require_relative '../person_class'

describe('Tests for methods inside Person class:') do
  before :all do
    @object = Person.new(20, 'Test')
  end
  it('Constructor should return a Person object.') do
    expect(@object).to(be_an_instance_of(Person))
  end
  it('Method add_rental should add Rental object to rentals array inside Person class.') do
    rental = double('Rental')
    @object.add_rental(rental)
    expect(@object.rentals).to(include(rental))
  end
  it('Method can_use_services should return a boolean depending on age constraints.') do
    expect(@object.can_use_services?).to(be(true))
  end
  it('Method correct_name should return a string depending on name value.') do
    expect(@object.correct_name).to(eq('Test'))
  end
end
