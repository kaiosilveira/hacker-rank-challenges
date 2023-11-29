# Challenge name

Challenge URL:

Challenge description goes here

**Example**

| input | expected result |
| ----- | --------------- |
| 'abc' | 5               |
| 'def' | 3               |
| 'ghi' | 5               |

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
# some ruby code here
```

The final code, including constraint validations, is available [here](./algorithm.rb).

## Samples 🥯

The samples used to run a quick sanity check on the implementation are:

```ruby
samples = [
  # add samples here
]
```

Which, after feeding it into our runner:

```ruby
HackerRank::Runner.new(samples).run do |n|
  HackerRank::Challenges.challenge_fn(n)
end
```

Gives the following output:

```
➜ ruby ./challenge/index.rb

challenge output
```

A good indication that the solution looks reasonable.

## Implementation benchmarking & time complexity analysis 📈

Let's now take a look at this implementation and see how it stands from a performance point of view. Below, we have a code analysis and a benchmarking of the solution.

### Time complexity 🕵🏽‍♂️

To perform a time complexity analysis of our code, we can scan it from top to bottom, writing the big $O$ notation for each line (the code was slightly modified to allow for individual line comments):

```ruby
# some code here
```

Which translates to the following expression:

[expression breakdown]

Which means **CONSTANT|LINEAR|QUADRATIC** time complexity.

### Benchmarking 📊

To get a visual feeling of how the function behaves as $n$ increases, a benchmark was run from **BENCHMARK_N_ZERO** up to **BENCHMARK_N_MAX**, resulting in the following chart:

```console
➜ cat ./challeng/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                   Results
             ┌──────────────────────────────────────────────────┐
        0.03 │                                                  │
             │                                                  │
             │                                                  │
             │                                                  │
             │                                            ..    │
             │                                            ||    │
             │                                            ||    │
   T(n)      │                                            /\    │
             │                                           .|lr--/│
             │                                     _.--/"`      │
             │                             .__r-`/"             │
             │                      /__\^/"`                    │
             │              .__--/""`                           │
             │       ..\r-""`                                   │
           0 │__r-/""`                                          │
             └──────────────────────────────────────────────────┘
             0                                             100000
                                      n
```

Which, ignoring eventual CPU fluctuations, matches the given time complexity pattern theoretically demonstrated by the code analysis above.

For the full benchmarking code, see [benchmarking.rb](./benchmarking.rb).
