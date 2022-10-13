# Angry Professor

Challenge URL: https://www.hackerrank.com/challenges/angry-professor/problem

A Discrete Mathematics professor has a class of students. Frustrated with their lack of discipline, the professor decides to cancel class if fewer than some number of students are present when class starts. Arrival times go from on time ($arrivalTime <= 0$) to arrived late ($arrivalTime > 0$).

**Example**

| a (students)      | k (threshold) | expected result (class canceled?) |
| ----------------- | ------------- | --------------------------------- |
| [-2, -1, 0, 1, 2] | 3             | NO                                |
| [-1, -3, 4, 2]    | 3             | YES                               |
| [0, -1, 2, 1]     | 2             | NO                                |

**Constraints**

- $1 \leq n \leq 100 $
- $1 \leq m \leq 100 $

## Test suite 🧪

The test suite for this challenge covers the constraints described above and a happy path using the example's data. The tests are:

- `test_raises_ex`
- `test_happy_path`

For the full test suite, see [algorithm.spec.rb](./algorithm.spec.rb).

## Algorithm resolution description 📄

Algorithm resolution description

```ruby
def self.was_class_canceled?(arrival_times:, threshold:)
  on_time_arrivals = arrival_times.count { |time| time <= 0 }
  on_time_arrivals < threshold
end
```

The final code, including constraint validations, is available [here](./algorithm.rb).

## Samples 🥯

The samples used to run a quick sanity check on the implementation are:

```ruby
samples = [
  HackerRank.create_sample(expected_result: "NO", params: [[-2, -1, 0, 1, 2], 3]),
  HackerRank.create_sample(expected_result: "YES", params: [[-1, -3, 4, 2], 3]),
  HackerRank.create_sample(expected_result: "NO", params: [[0, -1, 2, 1], 2]),
]
```

Which, after feeding it into our runner:

```ruby
HackerRank::Runner.new(samples).run do |*params|
  student_times, threshold = params
  HackerRank::Challenges.angry_professor(student_times, threshold)
end
```

Gives the following output:

```
➜ ruby angry-professor/index.rb
Running sample #1
Success! ✅
  0.000015   0.000006   0.000021 (  0.000016)
Running sample #2
Success! ✅
  0.000005   0.000003   0.000008 (  0.000008)
Running sample #3
Success! ✅
  0.000004   0.000003   0.000007 (  0.000007)
```

A good indicative that the solution looks reasonable.

## Implementation benchmarking & time complexity analysis 📈

Let's now take a look at this implementation and see how it stands from a performance point of view. Below, we have a code analysis and a benchmarking of the solution.

### Code analysis 🕵🏽‍♂️

Code analysis considerations

```ruby
def self.was_class_canceled?(arrival_times:, threshold:)
  on_time_arrivals = arrival_times.count { |time| time <= 0 }
  on_time_arrivals < threshold
end
```

Which translates to the following expression:

[expression breakdown]

Which means **CONSTANT|LINEAR|QUADRATIC** time complexity.

### Benchmarking 📊

To get a visual feeling of how the function behaves as $n$ increases, a benchmark was run from **BENCHMARK_N_ZERO** up to **BENCHMARK_N_MAX**, resulting in the following chart:

```console
➜ cat ./angry-professor/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                  Results
            ┌──────────────────────────────────────────────────┐
        0.2 │                                                  │
            │                                                  │
            │                                                  │
            │                                                 .│
            │                                            ._.-/`│
            │                                        ..-/`     │
            │                                   .../"`         │
   T(n)     │                               ._r/`              │
            │                           ../"`                  │
            │                      ./\/"`                      │
            │                 ._-""`                           │
            │             ..-"`                                │
            │        ._r-/`                                    │
            │    ..-/`                                         │
          0 │_,-"`                                             │
            └──────────────────────────────────────────────────┘
            0                                              10000
                                     n
```

Which, ignoring eventual CPU fluctuations, matches the given time complexity pattern theoretically demonstrated by the code analysis above.

For the full benchmarking code, see [benchmarking.rb](./benchmarking.rb).
