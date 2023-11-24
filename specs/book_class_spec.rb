require_relative '../book_class'

describe('Tests for methods inside Book class:') do
  before :all do
    @object = Book.new('title', 'author')
  end
  it('Constructor should return a Book object.') do
    expect(@object).to(be_an_instance_of(Book))
  end
  it('Method add_rental should add Rental object to rentals array inside Book class.') do
    rental = double('Rental')
    @object.add_rental(rental)
    expect(@object.rentals).to(include(rental))
  end
  it('Method generate_string should return a hash with instance variables of Book class.') do
    expected = { title: 'title', author: 'author' }
    result = @object.generate_string
    expect(result).to(eq(expected))
  end
  it('Method parse_string should return a new Book object.') do
    arguments = { 'title' => 'title', 'author' => 'author' }
    object = Book.parse_string(arguments)
    expect(object).to(be_an_instance_of(Book))
  end
  it('Method input_arguments should return a new Book object.') do
    allow($stdout).to(receive(:write))
    allow(Book).to(receive(:gets)).and_return('title', 'author')
    object = Book.input_arguments
    expect(object).to(be_an_instance_of(Book))
  end
end
