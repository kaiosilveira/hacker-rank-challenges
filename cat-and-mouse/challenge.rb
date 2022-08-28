require_relative './get_closest_or_default.rb'

module HackerRank
  module Challenges
    def self.cat_and_mouse(catA, catB, mouse)
      itemA = { position: catA, label: 'Cat A' }
      itemB = { position: catB, label: 'Cat B' }
      target = { position: mouse, label: 'Mouse C' }

      Algorithms.get_closest_or_default(itemA: itemA, itemB: itemB, target: target)
    end
  end
end
