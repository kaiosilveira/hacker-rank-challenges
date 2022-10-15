module HackerRank
  module Exceptions
    class InputOutOfConstraintsException < Exception
      def initialize(input_name:, constraints:)
        super(
          "'#{input_name}' was out of the specified constraints. Expected #{constraints}."
        )
      end
    end

    class InvalidInputTypeException < Exception
      def initialize(input_name:, expected_type:)
        super(
          "'#{input_name}' does not have the correct type. Expected it to be #{expected_type}."
        )
      end
    end

    class InvalidInputFormatException < Exception
      def initialize(input_name:, expected_format:)
        super(
          "'#{input_name}' was not in the correct format. Expected it to be like #{expected_format}."
        )
      end
    end

    class ArrayOutOfConstraintsException < Exception
      def initialize(input_name:, expected_max_size:, actual_size:)
        super(
          "'#{input_name}' was out of the defined constraints. Expected it to have a max size of #{expected_max_size}, but it had size #{actual_size}."
        )
      end
    end
  end
end
