require_relative './challenge.rb'
require_relative '../_utils/hacker-rank/hacker-rank.rb'

samples = [
  HackerRank.create_sample(expected_result: [5, 3], params: [[3, 4, 5], 2, [1, 2]]),
  HackerRank.create_sample(expected_result: [2, 3, 1], params: [[1, 2, 3], 2, [0, 1, 2]])
]

HackerRank::Runner.new(samples).run do |*params|
  array, number_of_rotations, queries = params
  HackerRank::Challenges.circular_array_rotation(
    input: array,
    number_of_rotations: number_of_rotations,
    queries: queries
  )
end
