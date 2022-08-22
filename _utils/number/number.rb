require 'securerandom'

module NumberUtils
  def create_random_integer(max: 100)
    SecureRandom.random_number(max)
  end
end
