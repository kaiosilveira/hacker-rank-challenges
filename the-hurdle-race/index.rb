require_relative './challenge.rb'
require_relative '../_utils/hacker-rank/hacker-rank.rb'

samples = [
  HackerRank.create_sample(expected_result: 'a', params: [1, 2])
]

HackerRank::Runner.new(samples).run do |*params|
  param1, param2 = params
  HackerRank::Challenges.challenge_name(param1, param2)
end
