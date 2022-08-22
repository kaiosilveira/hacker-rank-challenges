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
  end
end