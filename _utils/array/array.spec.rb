require 'test/unit'

require_relative './array.rb'

class ArrayUtilsTest < Test::Unit::TestCase
  include ArrayUtils

  def test_creates_an_array_of_integers_with_the_specified_size
    size = 10

    arr = create_array_of_random_integers(size: size)

    assert_equal size, arr.size
    arr.each { |i| assert_instance_of Integer, i }
  end
end