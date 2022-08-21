require "test/unit"
require_relative './left-rotation.rb'

class TestLeftRotation < Test::Unit::TestCase
  def test_shifts_the_elements_d_positions_to_the_left
    d = 2
    arr = [1, 2, 3, 4, 5]
    expected_result = [3, 4, 5, 1, 2]

    assert_equal expected_result, perform_left_rotation(d, arr)
  end
end
