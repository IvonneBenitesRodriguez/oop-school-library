require_relative '../nameable_class'

describe('Tests for methods inside Nameable class:') do
  it('Method correct_name should raise an exception.') do
    expect { Nameable.new.correct_name }.to(raise_error(NotImplementedError))
  end
end
