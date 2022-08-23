require_relative './challenge.rb'
require_relative '../_utils/hacker-rank/hacker-rank.rb'

samples = [
  HackerRank.create_sample(expected_result: 'Bon Appetit', params: [[2, 4, 6], 2, 3]),
  HackerRank.create_sample(expected_result: 5, params: [[3, 10, 2, 9], 1, 12]),
]

HackerRank::Runner.new(samples).run do |*params|
  HackerRank::Challenges.bon_appetit(*params)
end
