require_relative "./challenge.rb"
require_relative "../_utils/hacker-rank/hacker-rank.rb"

samples = [
  HackerRank.create_sample(
    expected_result: 8,
    params: [
      [1, 3, 1, 3, 1, 4, 1, 3, 2, 5, 5, 5, 5, 1, 1, 5, 5, 1, 5, 2, 5, 5, 5, 5, 5, 5],
      "torn"
    ]
  ),
  HackerRank.create_sample(
    expected_result: 9,
    params: [
      [1, 3, 1, 3, 1, 4, 1, 3, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5],
      "abc"
    ]
  ),
  HackerRank.create_sample(
    expected_result: 28,
    params: [
      [1, 3, 1, 3, 1, 4, 1, 3, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 7],
      "zaba"
    ]
  )
]

HackerRank::Runner.new(samples).run do |*args|
  char_heights, word = args
  HackerRank::Challenges.design_pdf_viewer(char_heights, word)
end
