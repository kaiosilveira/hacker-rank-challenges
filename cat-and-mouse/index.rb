require 'test/unit'

def cat_and_mouse(catA, catB, mouse)
  cat_a_distance = (mouse - catA).abs
  cat_b_distance = (mouse - catB).abs

  return 'Cat A' if cat_a_distance < cat_b_distance
  return 'Cat B' if cat_b_distance < cat_a_distance

  'Mouse C'
end

class CatAndMouseTest < Test::Unit::TestCase
  def test_cat_A_gets_the_mouse
    catA = 3
    catB = 4
    mouse = 2
    expected_result = 'Cat A'

    assert_equal expected_result, cat_and_mouse(catA, catB, mouse)
  end

  def test_cat_B_gets_the_mouse
    catA = 2
    catB = 5
    mouse = 4
    expected_result = 'Cat B'

    assert_equal expected_result, cat_and_mouse(catA, catB, mouse)
  end

  def test_mouse_escapes
    catA = 2
    catB = 2
    mouse = 4
    expected_result = 'Mouse C'

    assert_equal expected_result, cat_and_mouse(catA, catB, mouse)
  end
end
