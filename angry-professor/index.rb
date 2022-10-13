require_relative "./challenge.rb"
require_relative "../_utils/hacker-rank/hacker-rank.rb"

samples = [
  HackerRank.create_sample(expected_result: "NO", params: [[-2, -1, 0, 1, 2], 3]),
  HackerRank.create_sample(expected_result: "YES", params: [[-1, -3, 4, 2], 3]),
  HackerRank.create_sample(expected_result: "NO", params: [[0, -1, 2, 1], 2]),
]

HackerRank::Runner.new(samples).run do |*params|
  student_times, threshold = params
  HackerRank::Challenges.angry_professor(student_times, threshold)
end
