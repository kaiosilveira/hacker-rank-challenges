require_relative '../number/number.rb'

module ArrayUtils
  include NumberUtils

  def create_array_of_random_integers(size:, item_max: 100)
    (0..size - 1).to_a.map { [1, create_random_integer(max: item_max)].max }
  end
end