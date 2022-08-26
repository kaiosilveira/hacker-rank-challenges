require_relative './challenge.rb'
require_relative '../_utils/hacker-rank/hacker-rank.rb'

samples = [
  HackerRank.create_sample(expected_result: 2, params: [4, 2, [2, 2, 1, 3, 2]]),
  HackerRank.create_sample(expected_result: 1, params: [4, 2, [1, 2, 1, 3, 2]]),
  HackerRank.create_sample(expected_result: 0, params: [3 , 2, [1, 1, 1, 1, 1, 1]]),
]

HackerRank::Runner.new(samples).run do |d, m, arr|
  HackerRank::Challenges.birthday(d, m, arr)
end
