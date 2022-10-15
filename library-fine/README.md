# Library Fine

Challenge URL: https://www.hackerrank.com/challenges/library-fine/problem

Your local library needs your help! Given the expected and actual return dates for a library book, create a program that calculates the fine (if any). The fee structure is as follows:

1. If the book is returned on or before the expected return date, no fine will be charged (i.e.: $fine = 0$).
2. If the book is returned after the expected return day but still within the same calendar month and year as the expected return date, $fine = 15 \times d$, where $d$ is the number of days late.
3. If the book is returned after the expected return month but still within the same calendar year as the expected return date, $fine = 500 \times m$, where $m$ is the number of months late.
4. If the book is returned after the calendar year in which it was expected, there is a fixed fine of $10.000$

Charges are based only on the least precise measure of lateness. For example, whether a book is due January 1, 2017 or December 31, 2017, if it is returned January 1, 2018, that is a year late and the fine would be $10.000$.

**Example**

| return date                     | expected return date           | fine |
| ------------------------------- | ------------------------------ | ---- |
| [day: 14, month: 7, year: 2018] | [day: 5, month: 7, year: 2018] | 135  |
| [day: 9, month: 6, year: 2015]  | [day: 6, month: 6, year: 2018] | 45   |

**Constraints**

- $1 \leq d1, d2 \leq 31 $
- $1 \leq m1, m2 \leq 12 $
- $1 \leq y1, y2 \leq 3000 $

## Test suite 🧪

The test suite for this challenge covers the constraints described above and some happy paths using data provided by the challenge's test cases.
The happy path tests are:

```ruby
def test_returns_zero_if_there_is_no_fine
  assert_equal 0, run_with(expected_date: [5, 7, 2018], date_returned: [5, 7, 2018])
  assert_equal 0, run_with(expected_date: [5, 7, 2018], date_returned: [5, 6, 2018])
  assert_equal 0, run_with(expected_date: [5, 7, 2019], date_returned: [5, 7, 2018])
  assert_equal 0, run_with(expected_date: [1, 1, 2019], date_returned: [2, 7, 2018])
end

def test_calculates_fine_for_n_days_late
  assert_equal 135, run_with(expected_date: [5, 7, 2018], date_returned: [14, 7, 2018])
end

def test_calculates_fine_for_two_months_late
  assert_equal 1000, run_with(expected_date: [5, 7, 2018], date_returned: [4, 9, 2018])
end

def test_calculates_fine_for_n_years_late
  assert_equal 20_000, run_with(expected_date: [5, 7, 2018], date_returned: [4, 7, 2020])
end
```

For the full test suite, see [algorithm.spec.rb](./algorithm.spec.rb).

## Algorithm resolution description 📄

To solve this challenge we can start by defining constants for each type of fee:
```ruby
DAILY_FEE = 15
MONTHLY_FEE = 500
YEARLY_FEE = 10_000
```

Then, we can check whether the year that the books were returned is lower than the expected return year. If it is, then it was returned on time and there is no fine, otherwise, we need to charge the yearly fee times the number of years they were due:

```ruby
return 0 if actual_year < expected_year
return YEARLY_FEE * (actual_year - expected_year) if actual_year > expected_year
```

The same logic applies to the month:

```ruby
return 0 if actual_month < expected_month
return MONTHLY_FEE * (actual_month - expected_month) if actual_month > expected_month
```

And finally, to the day:

```ruby
return DAILY_FEE * (actual_day - expected_day) if actual_day > expected_day
return 0
```

The complete code looks like this:

```ruby
def self.calculate_library_fine(expected_date:, date_returned:)
  validate_inputs(date_returned, expected_date)

  actual_day, actual_month, actual_year = date_returned
  expected_day, expected_month, expected_year = expected_date

  return 0 if actual_year < expected_year
  return YEARLY_FEE * (actual_year - expected_year) if actual_year > expected_year

  return 0 if actual_month < expected_month
  return MONTHLY_FEE * (actual_month - expected_month) if actual_month > expected_month

  return DAILY_FEE * (actual_day - expected_day) if actual_day > expected_day
  return 0
end
```

The final code, including constraint validations, is available [here](./algorithm.rb).

## Samples 🥯

The samples used to run a quick sanity check on the implementation are:

```ruby
samples = [
  HackerRank.create_sample(expected_result: 0, params: [[5, 7, 2018], [5, 7, 2018]]),
  HackerRank.create_sample(expected_result: 0, params: [[5, 7, 2018], [5, 6, 2018]]),
  HackerRank.create_sample(expected_result: 0, params: [[5, 7, 2019], [5, 7, 2018]]),
  HackerRank.create_sample(expected_result: 0, params: [[1, 1, 2019], [2, 7, 2018]]),
  HackerRank.create_sample(expected_result: 135, params: [[5, 7, 2018], [14, 7, 2018]]),
  HackerRank.create_sample(expected_result: 1000, params: [[5, 7, 2018], [4, 9, 2018]]),
  HackerRank.create_sample(expected_result: 20_000, params: [[5, 7, 2018], [4, 7, 2020]]),
]
```

Which, after feeding it into our runner:

```ruby
HackerRank::Runner.new(samples).run do |*params|
  expected_date, date_returned = params
  HackerRank::Challenges.library_fine(date_returned, expected_date)
end
```

Gives the following output:

```
➜ ruby library-fine/index.rb
Running sample #1
Success! ✅
  0.000019   0.000006   0.000025 (  0.000021)
Running sample #2
Success! ✅
  0.000019   0.000007   0.000026 (  0.000021)
Running sample #3
Success! ✅
  0.000009   0.000003   0.000012 (  0.000012)
Running sample #4
Success! ✅
  0.000010   0.000004   0.000014 (  0.000014)
Running sample #5
Success! ✅
  0.000011   0.000006   0.000017 (  0.000017)
Running sample #6
Success! ✅
  0.000009   0.000005   0.000014 (  0.000015)
Running sample #7
Success! ✅
  0.000009   0.000003   0.000012 (  0.000012)
```

A good indicative that the solution looks reasonable.

## Implementation benchmarking & time complexity analysis 📈

Let's now take a look at this implementation and see how it stands from a performance point of view. Below, we have a code analysis and a benchmarking of the solution.

### Code analysis 🕵🏽‍♂️

The code analysis for this challenge is straightforward, as there only variable assignments and conditional return statements, without any loop. See below the code commented with the corresponding time complexity for each line:

```ruby
def self.calculate_library_fine(expected_date:, date_returned:)
  validate_inputs(date_returned, expected_date) # O(1)

  actual_day, actual_month, actual_year = date_returned # O(1)
  expected_day, expected_month, expected_year = expected_date # O(1)

  return 0 if actual_year < expected_year # O(1)
  return YEARLY_FEE * (actual_year - expected_year) if actual_year > expected_year # O(1)

  return 0 if actual_month < expected_month # O(1)
  return MONTHLY_FEE * (actual_month - expected_month) if actual_month > expected_month # O(1)

  return DAILY_FEE * (actual_day - expected_day) if actual_day > expected_day # O(1)
  return 0 # O(1)
end
```

Which translates to the following expression:

$O(1) + O(1) + O(1) + O(1) + O(1) + O(1) + O(1) + O(1) + O(1)$

Which can be simplified as:

$O(1) + O(1) + O(1) + O(1) + O(1) + O(1) + O(1) + O(1) + O(1) \implies 9.O(1)$

And, as there are only constant terms, we can safely say that the time complexity $T$ for the implementation is:

$T = O(1)$

Which means a **Constant** time complexity.

### Benchmarking 📊

To get a visual feeling of how the function behaves as $n$ increases, a benchmark was run $100,000$ times, in a step of 100 by 100, resulting in the following chart:

```console
➜ cat ./library-fine/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                      Results
                ┌──────────────────────────────────────────────────┐
        3.0e-05 │                                                  │
                │                                                  │
                │                                                  │
                │                         .                        │
                │                         |                        │
                │                         |       .                │
                │                         |       |                │
   T(n)         │                         |       |                │
                │,                        |       |                │
                │|                       ,|       |                │
                │|..      .              /|.      ] .           || │
                │L]L__,__/| ,.v, .v,\,,,.@|1_,,,_,@_@,.,......,,|L@│
                │@@@@@@@@@L_@@@@v@@@@@@@@@@@@@@@@@@@@@@@@@1/@/@@@T@│
                │|T\\"'`'/\\"/TT/^"T`T/\//'"^\|^TT/'`/"/TT"T\TTTT'`│
              0 │|                                                 │
                └──────────────────────────────────────────────────┘
                0                                             100000
                                         n
```

Which, ignoring eventual CPU fluctuations, matches the given time complexity pattern theoretically demonstrated by the code analysis above, as the input doesn't rely on any array with variating sizes.

For the full benchmarking code, see [benchmarking.rb](./benchmarking.rb).
