# Beautiful days at the Movies

Challenge URL: https://www.hackerrank.com/challenges/beautiful-days-at-the-movies/problem

Given a range of numbered days $[i...j]$ and a number $k$, determine the number of days in the range that are beautiful.

Beautiful numbers are defined as numbers where $|i-reverse(i)|$ is evenly divisible by $k$. If a day's value is a beautiful number, it is a beautiful day. Return the number of beautiful days in the range.

**Example**

| k   | Day range   | Result |
| --- | ----------- | ------ |
| $6$ | $[20...23]$ | $2$    |

**Constraints**

- $1 \leq i \leq j \leq 2.10^6$
- $1 \leq k \leq 2.10^9$

## Test suite

The test suite for this challenge covers the constraints described above and a happy path using the example's data. The tests are:

- `test_raises_an_exception_if_day0_is_lower_than_1`
- `test_raises_an_exception_if_dayN_is_lower_than_1`
- `test_raises_an_exception_if_day0_is_greater_than_dayN`
- `test_raises_an_exception_if_day0_is_greater_than_2_000_000`
- `test_raises_an_err_if_dayN_is_greater_than_2_000_000_and_ctt_v8n_enabled`
- `test_does_not_raise_ex_if_dayN_is_greater_than_2_000_000_and_ctt_v8n_disabled`
- `test_raises_ex_if_divisor_is_lower_than_1`
- `test_raises_ex_if_divisor_is_greater_than_2_000_000_000`
- `test_raises_ex_if_divisor_is_greater_than_2_000_000_000_and_ctt_v8n_enabled`
- `test_does_not_raise_ex_if_divisor_is_greater_than_2_000_000_000_and_ctt_v8n_disabled`
- `test_identifies_beautiful_days_correctly`

For the full test suite, see [count_beautiful_days.spec.rb](./count_beautiful_days.spec.rb).

## Algorithm resolution description

To solve this challenge we need to create a range of numbers using the initial and final days provided as inputs:

```ruby
(day0..dayN)
```

And count how many items inside this range matches the pattern $\frac {|n-reverse(n)|}{divisor} = 0$.

To get the reversed value of $n$, we can do:

```ruby
reversed = n.to_s.reverse.to_i
```

Then, we just need to perform the division:

```ruby
(n - reversed) % divisor == 0
```

And that's it! The final code is:

```ruby
def self.count_beautiful_days(day0:, dayN:, divisor:)
  # constraint validations omitted for simplicity
  (day0..dayN).count do |n|
    reversed = n.to_s.reverse.to_i
    (n - reversed) % divisor == 0
  end
end
```

## Samples

The single sample provided in the example was used to run a quick sanity check:

```ruby
samples = [
  HackerRank.create_sample(expected_result: 2, params: [20, 23, 6]),
]
```

Which, after feeding it into our runner:

```ruby
HackerRank::Runner.new(samples).run do |i, j, k|
  HackerRank::Challenges.beautiful_days(i, j, k)
end
```

Returned the following output:

```console
➜ ruby beautiful-days/index.rb
Running sample #1
Success! ✅
  0.000030   0.000011   0.000041 (  0.000035)
```

A good indicative that the solution looks reasonable.

## Implementation benchmarking & time complexity analysis

Let's now take a look at this implementation and see how it stands from a performance point of view. Below, we have a code analysis and a benchmarking of the solution.

### Code analysis

Performing a code analysis on this code is straightforward:

```ruby
(day0..dayN).count do |n| # n x block
  reversed = n.to_s.reverse.to_i # O(1)
  (n - reversed) % divisor == 0 # O(1)
end
```

Which translates to the following expression:

$n.(O(1) + O(1))$

Which can be simplified as:

$2.O(1).n$

As $2.O(1)$ is a constant, we can say that the time complexity $T$ for this implementation is:

$T = O(n)$

Which means a linear time complexity.

### Benchmarking

To get a visual feeling of how the function behaves as the range size increases, a benchmark was run from $dayN = 1$ up to $dayN = 2000000$, resulting in the following chart:

```console
➜ cat ./beautiful-days/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                  Results
            ┌──────────────────────────────────────────────────┐
        0.6 │                                                  │
            │                                            ../`  │
            │                                        ../"`     │
            │                                      ./`         │
            │                                  ..-"            │
            │                               .r/`               │
            │                           .r/"`                  │
   T(n)     │                        _r/`                      │
            │                    ../"                          │
            │                 .r/`                             │
            │             .r/"`                                │
            │          ../`                                    │
            │      .,/"`                                       │
            │   _r/`                                           │
          0 │_r/                                               │
            └──────────────────────────────────────────────────┘
            0                                            2000000
                                     n
```

Which, ignoring eventual CPU fluctuations, matches the given time complexity pattern theoretically demonstrated by the code analysis above.
