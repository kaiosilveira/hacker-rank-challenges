# Electronics Shop

URL: https://www.hackerrank.com/challenges/electronics-shop/problem

A person wants to determine the most expensive computer keyboard and USB drive that can be purchased with a give budget. Given price lists for keyboards and USB drives and a budget, find the cost to buy them. If it is not possible to buy both items, return `-1`.

**Constraints**

- $1 \leq m, n \leq 1000$
- $1 \leq b \leq 10^{6}$
- The price of each item is in the inclusive range $[1, 10^{6}]$

## Test suite

The test suite for this challenge covers the constraints mentioned above regarding budget (`limit`), keyboards (`first_array`) and drives (`second_array` ). It also covers bypassing these limits when using the `ALLOW_UNCONSTRAINED_ARRAYS_ENABLED`. Finally, it covers the function's functionality itself, including particular cases for when it needs to return `-1`. The tests are:

- `test_raises_exception_if_first_array_has_more_than_1000_items_and_flag_is_disabled`
- `test_executes_if_first_array_has_more_than_1000_items_and_flag_is_enabled`
- `test_raises_exception_if_second_array_has_more_than_1000_items_and_flag_is_disabled`
- `test_executes_if_second_array_has_more_than_1000_items_and_flag_is_enabled`
- `test_raises_exception_if_limit_is_less_than_1`
- `test_raises_exception_if_limit_is_greater_than_1_000_000`
- `test_returns_minus_one_if_impossible_to_select_an_item_from_the_first_array`
- `test_returns_minus_one_if_select_an_item_from_the_second_array`
- `test_returns_the_max_possible_sum`

For the full test suite implementation, see [./find_max_sum.spec.rb](./find_max_sum.spec.rb).

## Challenge resolution description

To solve this problem we need to compare each price of `keyboard` with each available alternative for `drive`, which essentially means to iterate over `keyboards` and inside of each iteration, go over `drives`:

```ruby
for keyboard in keyboards
  for drive in drives
# ...
```

Then, we need to calculate the sum of `keyboard` and `drive` to see if it is inside the budget. If it is inside the budget, we can set `max_sum` to it:

```ruby
  sum = keyboard + drive
```

In this case, `max_sum` holds the maximum result for all iterations, so it starts with `-1`:

```ruby
max_sum = -1
```

And is returned in the end:

```ruby
  # ...
  max_sum
end
```

The final code is:

```ruby
module HackerRank
  module Algorithms
    def self.find_max_sum(budget:, keyboards:, drives:)
      max_sum = -1

      for keyboard in keyboards
        for drive in drives
          sum = keyboard + drive
          max_sum = sum if sum > max_sum && sum <= limit
        end
      end

      max_sum
    end
  end
end
```

For the actual ruby file containing the code, see [find_max_sum.rb](./find_max_sum.rb)

## Samples

The samples for this challenge are:

| budget | keyboards    | drives     | expected result |
| ------ | ------------ | ---------- | --------------- |
| 60     | [40, 50, 60] | [5, 8, 12] | 58              |
| 10     | [3, 1]       | [5, 2, 8]  | 9               |
| 5      | [4]          | [5]        | -1              |

We can feed them into our runner:

```ruby
samples = [
  HackerRank::Samples.create_sample(expected_result: 58, params: [[40, 50, 60], [5, 8, 12], 60]),
  HackerRank::Samples.create_sample(expected_result: 9, params: [[3, 1], [5, 2, 8], 10]),
  HackerRank::Samples.create_sample(expected_result: -1, params: [[4], [5], 5]),
]

HackerRank::Runner.new(samples).run do |*params|
  keyboards, drives, budget = params
  HackerRank::Challenges.get_money_spent(keyboards, drives, budget)
end
```

Which outputs:

```console
➜ ruby electronic-shops/index.rb
Running sample #1
Success! ✅
  0.000017   0.000007   0.000024 (  0.000019)
Running sample #2
Success! ✅
  0.000006   0.000002   0.000008 (  0.000009)
Running sample #3
Success! ✅
  0.000003   0.000003   0.000006 (  0.000006)
```

A good indicative that the solution works.

## Implementation benchmarking & time complexity analysis

Starting with the code analysis line by line, we can notice that we have a `for` statement inside another `for` statement. We can say that the outer `for` adds `m times &block`, where `&block` is what will be executed inside of it. The same applies to the inner `for`. The statements inside the inner `for` themselves are on the order of time complexity `O(1)`, as it's just simple math and some logical comparisons. The code below has the complexities added as comments:

```ruby
for keyboard in first_array_sorted # m x &block
  for drive in second_array_sorted # n x &block
    sum = keyboard + drive # O(1)
    max_sum = sum if sum > max_sum && sum <= limit # O(1)
  end
end
```

Summing it all together, we have:

- $T \propto m.n.(O(1) + O(1))$

Which can be simplified as:

- $T \propto m.n.(2.O(1))$

And finally:

- $T \propto 2.m.n.(O(1))$

Than, we can remove the constant `2`:

- $T \propto m.n.(O(1))$

And as `O(1)` is itself a constant here, we can remove it as well, leaving with:

- $T \propto m.n$

Finally, as `T` is proportional to `m.n`, we can say that `T` grows in the order of complexity O(n^2), for the cases where `n` is close enough to `m`, which represents exponential time complexity.

- $T = O(n^{2})$

**Benchmarking**

To visually demonstrate the exponential time complexity calculated above, we set `m = n` and went way above the constraint of `n <= 1_000`, taking it up to `10_000`, in a growth step of `1000` items for each iteration. The timings are:

```console
➜ ruby electronic-shops/benchmark.rb
n = 1  0.000043   0.000122   0.000165 (  0.000186)
n = 1001  0.062177   0.026438   0.088615 (  0.089012)
n = 2001  0.241874   0.057783   0.299657 (  0.300795)
n = 3001  0.530878   0.079650   0.610528 (  0.611346)
n = 4001  0.916831   0.105955   1.022786 (  1.023973)
n = 5001  1.432491   0.129715   1.562206 (  1.563282)
n = 6001  2.124525   0.159202   2.283727 (  2.286704)
n = 7001  2.784454   0.182707   2.967161 (  2.969717)
n = 8001  3.647584   0.210904   3.858488 (  3.862162)
n = 9001  4.552766   0.230148   4.782914 (  4.786938)
```

And the resulting chart is:

```console
➜ cat ./electronic-shops/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                Results
          ┌──────────────────────────────────────────────────┐
        5 │                                            ./    │
          │                                          .r`     │
          │                                         .`       │
          │                                       ./         │
          │                                     ./           │
          │                                   ./`            │
          │                                 ./`              │
   T(n)   │                              .r"                 │
          │                            ./`                   │
          │                          ./`                     │
          │                       _-"                        │
          │                    _-"                           │
          │                _r/"                              │
          │          ._r-/"                                  │
        0 │_____.--/"`                                       │
          └──────────────────────────────────────────────────┘
          0                                              10000
                                   n
```

For the complete code implementation of this analysis, see [benchmark.rb](./benchmark.rb).
