require_relative "./challenge.rb"
require_relative "../_utils/hacker-rank/hacker-rank.rb"

samples = [
  HackerRank.create_sample(expected_result: 0, params: [5, 7, 2018, 5, 7, 2018]),
  HackerRank.create_sample(expected_result: 0, params: [5, 7, 2018, 5, 6, 2018]),
  HackerRank.create_sample(expected_result: 0, params: [5, 7, 2019, 5, 7, 2018]),
  HackerRank.create_sample(expected_result: 0, params: [1, 1, 2019, 2, 7, 2018]),
  HackerRank.create_sample(expected_result: 135, params: [5, 7, 2018, 14, 7, 2018]),
  HackerRank.create_sample(expected_result: 1000, params: [5, 7, 2018, 4, 9, 2018]),
  HackerRank.create_sample(expected_result: 20_000, params: [5, 7, 2018, 4, 7, 2020]),
]

HackerRank::Runner.new(samples).run do |*params|
  d1, m1, y1, d2, m2, y2 = params
  HackerRank::Challenges.library_fine(d1, m1, y1, d2, m2, y2)
end
