require_relative "./challenge.rb"
require_relative "../_utils/hacker-rank/hacker-rank.rb"

samples = [
  HackerRank.create_sample(
    expected_result: [2, 1],
    params: [[2, 3, 2, 1], [[1, 2], [2, 4]]],
  ),
  HackerRank.create_sample(
    expected_result: [1, 2, 3, 2, 1],
    params: [[2, 3, 1, 2, 3, 2, 3, 3], [[0, 3], [4, 6], [6, 7], [3, 5], [0, 7]]],
  ),
]

HackerRank::Runner.new(samples).run do |*params|
  input, cases = params
  HackerRank::Challenges.service_lane(input:, cases:)
end
