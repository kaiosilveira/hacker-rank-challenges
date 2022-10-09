require_relative './draw_n_tokens.rb'

module HackerRank
  module Challenges
    def self.staircase(n)
      result = []

      sequence = (0...n).to_a
      sequence.reverse.each do |n|
        offset = Algorithms.draw_n_tokens(n: n - 1, token: ' ')
        steps = Algorithms.draw_n_tokens(n: sequence.size - n - 1, token: '#')
        row = offset + steps
        puts row
        result << row
      end

      result
    end
  end
end
