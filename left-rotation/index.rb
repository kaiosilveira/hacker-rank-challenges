require_relative './challenge.rb'
require_relative '../_utils/hacker-rank/hacker-rank.rb'

samples = [
  HackerRank::Samples.create_sample(
    expected_result: [3, 4, 5, 1, 2],
    params: [2, [1, 2, 3, 4, 5]
  ])
]

HackerRank::Runner.new(samples).run do |*params|
  d, arr = params
  HackerRank::Challenges.left_rotation(d, arr)
end
