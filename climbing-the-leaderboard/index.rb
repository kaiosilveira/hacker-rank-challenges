require 'set'
require 'benchmark'
require_relative './challenge.rb'
require_relative '../_utils/hacker-rank/hacker-rank.rb'

ENV["ALLOW_UNCONSTRAINED_ARRAYS_ENABLED"] = "enabled"

large_expected_result = []
File.open("#{File.expand_path File.dirname(__FILE__)}/expected_result.txt").each_line do |line|
  large_expected_result << Integer(line)
end

large_ranked_sample = []
File.open("#{File.expand_path File.dirname(__FILE__)}/ranked.txt") do |file|
  large_ranked_sample = file.read.split(' ').map { |i| Integer(i) }
end

large_player_sample = []
File.open("#{File.expand_path File.dirname(__FILE__)}/player.txt") do |file|
  large_player_sample = file.read.split(' ').map { |i| Integer(i) }
end

samples = [
  HackerRank::Samples.create_sample(
    expected_result: [4, 3, 1], params: [[100, 90, 90, 80], [70, 80, 105]]
  ),
  HackerRank::Samples.create_sample(
    expected_result: [6, 5, 4, 2, 1], params: [[100, 90, 90, 80, 75, 60], [50, 65, 77, 90, 102]]
  ),
  HackerRank::Samples.create_sample(
    expected_result: [6, 4, 2, 1], params: [[100, 100, 50, 40, 40, 20, 10], [5, 25, 50, 120]]
  ),
  HackerRank::Samples.create_sample(
    expected_result: large_expected_result, params: [large_ranked_sample, large_player_sample]
  ),
]

HackerRank::Runner.new(samples).run do |*params|
  ranked, player = params
  HackerRank::Challenges.climbing_leaderboard(ranked, player)
end
