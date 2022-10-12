require_relative "../_utils/exceptions/exceptions.rb"

module HackerRank
  module Algorithms
    include HackerRank::Exceptions

    def self.calculate_rect_area(char_heights:, word:)
      raise InputOutOfConstraintsException.new(
        input_name: "char_heights.length",
        constraints: "char_heights.length = 27"
      ) if char_heights.length != 26

      raise InputOutOfConstraintsException.new(
        input_name: "char_heights",
        constraints: "1 <= char_heights[i] <= 7"
      ) if char_heights.any? { |h| h < 1 || h > 7 }

      alphabet = "abcdefghijklmnopqrstuvxwyz"
      word_heights = word.split("").map { |char| char_heights[alphabet.index(char)] }
      tallest_char_height = word_heights.max

      tallest_char_height * word.size
    end
  end
end
