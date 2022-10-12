require_relative "./calculate_rect_area.rb"
module HackerRank
  module Challenges
    def self.design_pdf_viewer(char_heights, word)
      Algorithms.calculate_rect_area(char_heights: char_heights, word: word)
    end
  end
end
