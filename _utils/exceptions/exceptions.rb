module HackerRank
  module Exceptions
    class InvalidMonthOfYearException < Exception
      def initialize
        super("Invalid month of year. Expected an integer between 1 and 31")
      end
    end

    class InvalidDayOfMonthException < Exception
      def initialize
        super("Invalid day of month value. Expected an integer between 1 and 31")
      end
    end

    class PossiblyUnboundArrayException < Exception
      def initialize
        super(
          "A possibly unbound array was passed as an argmument. To explicity allow that, set UNBOUND_ARRAYS_ENABLED=enabled"
        )
      end
    end

    class ArrayOutOfConstraintsException < Exception
      def initialize
        super(
          "An array that does not follow the constraints was passed as a parameter. To explicity allow that, set ALLOW_UNCONSTRAINED_ARRAYS=enabled"
        )
      end
    end

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
