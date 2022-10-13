require_relative "./challenge.rb"
require_relative "../_utils/hacker-rank/hacker-rank.rb"

samples = [
  HackerRank.create_sample(expected_result: 5, params: [1, 1, 2, 2, 4, 4, 5, 5, 5]),
  HackerRank.create_sample(expected_result: 3, params: [4, 6, 5, 3, 3, 1]),
  HackerRank.create_sample(expected_result: 5, params: [1, 2, 2, 3, 1, 2]),
]

HackerRank::Runner.new(samples).run do |*arr|
  HackerRank::Challenges.picking_numbers(arr)
end
