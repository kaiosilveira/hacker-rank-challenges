require_relative './challenge.rb'
require_relative '../_utils/hacker-rank/hacker-rank.rb'

samples = [
  HackerRank.create_sample(expected_result: 'Cat B', params: [2, 5, 4]),
  HackerRank.create_sample(expected_result: 'Cat B', params: [1, 2, 3]),
  HackerRank.create_sample(expected_result: 'Mouse C', params: [1, 3, 2]),
]

HackerRank::Runner.new(samples).run do |*params|
  catA, catB, mouse = params
  HackerRank::Challenges.cat_and_mouse(catA, catB, mouse)
end
