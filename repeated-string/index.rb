require_relative "./challenge.rb"
require_relative "../_utils/hacker-rank/hacker-rank.rb"

samples = [
  HackerRank.create_sample(expected_result: 4, params: ["abcabc", 10]),
  HackerRank.create_sample(expected_result: 4, params: ["abcab", 10]),
  HackerRank.create_sample(expected_result: 7, params: ["aba", 10]),
]

HackerRank::Runner.new(samples).run do |pattern, sequence_length|
  HackerRank::Challenges.repeated_string(pattern, sequence_length)
end
