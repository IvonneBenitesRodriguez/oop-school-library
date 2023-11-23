require_relative '../nameable_class'
require_relative '../decorator_class'
require_relative '../trimmer_class'

describe('Tests for methods inside Trimmer class:') do
  it('Method correct_name should return a string with maximum of 10 characters.') do
    person = double('Person')
    allow(person).to(receive(:correct_name)).and_return('012345678910')
    result = Trimmer.new(person).correct_name
    expect(result).to(eq('0123456789'))
  end
end
