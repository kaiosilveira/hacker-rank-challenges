require 'test/unit'

def get_money_spent(budget, keyboards, drives)
  sorted_keyboards = keyboards
  sorted_drives = drives
  max_money_spent = -1

  for keyboard in sorted_keyboards
    for drive in sorted_drives
      money_spent = keyboard + drive
      max_money_spent = money_spent if money_spent > max_money_spent && money_spent <= budget
    end
  end

  max_money_spent
end

class GetMoneySpentTest < Test::Unit::TestCase
  def test_returns_minus_one_if_impossible_to_buy_a_keyboard
    b = 5
    keyboards = [10]
    drives = [1, 2, 3]
    expected_result = -1

    assert_equal expected_result, get_money_spent(b, keyboards, drives)
  end

  def test_returns_minus_one_if_impossible_to_buy_a_drive
    b = 5
    keyboards = [1, 2, 3]
    drives = [10]
    expected_result = -1

    assert_equal expected_result, get_money_spent(b, keyboards, drives)
  end

  def test_money_spent
    b = 60
    keyboards = [40, 50, 60]
    drives = [5, 8, 12]
    expected_result = 58

    assert_equal expected_result, get_money_spent(b, keyboards, drives)
  end
end
