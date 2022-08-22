require 'test/unit'
require_relative './index.rb'

class NumberUtilsTest < Test::Unit::TestCase
  include NumberUtils

  def test_generates_an_integer
    assert_instance_of Integer, create_random_integer
  end

  def test_generates_an_integer_lower_or_equal_the_maximum_provided
    max = 10
    (0..10000).to_a.each do
      assert create_random_integer(max: max) <= max
    end
  end
end
