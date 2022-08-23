require_relative './challenge.rb'
require_relative '../_utils/hacker-rank/hacker-rank.rb'

samples = [
  HackerRank::Samples.create_sample(expected_result: 2, params: [[3, 2, 1, 3]]),
]

HackerRank::Runner.new(samples).run do |arr|
  HackerRank::Challenges.birthday_cake_candles(arr)
end
