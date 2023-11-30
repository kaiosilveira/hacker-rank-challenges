require "test/unit"
require_relative "./challenge.rb"
require_relative "../_utils/algorithm-test/index.rb"
require_relative "../_utils/exceptions/exceptions.rb"

module HackerRank
  module Challenges
    module AngryProfessor
      class AngryProfessorTests < Algorithms::AlgorithmTest
        def test_raises_exception_if_arrival_times_is_not_an_array
          assert_raises_invalid_type &-> {
            AngryProfessor.was_class_canceled?(arrival_times: 3, threshold: 3)
          }
        end
  
        def test_raises_exception_if_arrival_times_array_size_is_smaller_than_the_lower_end_constraint
          assert_raises_arr_out_of_min_size &-> {
            AngryProfessor.was_class_canceled?(arrival_times: [], threshold: 3)
          }
        end
  
        def test_raises_exception_if_input_array_size_is_greater_than_the_higher_end_constraint
          assert_raises_arr_out_of_max_size &-> {
            AngryProfessor.was_class_canceled?(
              arrival_times: create_array_of_random_integers(size: 1001),
              threshold: 3
            )
          }
        end
      end
    end
  end
end
