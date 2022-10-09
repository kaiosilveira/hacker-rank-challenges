require_relative './challenge.rb'
require_relative '../_utils/hacker-rank/hacker-rank.rb'
require_relative './challenge.rb'

samples = [
  HackerRank.create_sample(expected_result: ['#'], params: 1),
  HackerRank.create_sample(
    expected_result: [
      ' #',
      '##'
    ],
    params: 2
  ),
  HackerRank.create_sample(
    expected_result: [
      '    #',
      '   ##',
      '  ###',
      ' ####',
      '#####',
    ],
    params: 5
  )
]

HackerRank::Runner.new(samples).run do |n|
  HackerRank::Challenges.staircase(n)
end
