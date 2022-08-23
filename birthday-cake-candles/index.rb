require_relative './count_max_items.rb'
require_relative '../_utils/hacker-rank/hacker-rank.rb'

samples = [
  HackerRank::Samples.create_sample(expected_result: 2, params: [[3, 2, 1, 3]]),
]

HackerRank::Runner.new(samples).run do |arr|
  HackerRank::Solutions.count_max_items(arr: arr)
end
