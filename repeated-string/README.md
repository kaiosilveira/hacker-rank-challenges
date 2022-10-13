# Challenge name

Challenge URL:

There is a string, $s$, of lowercase English letters that is repeated infinitely many times. Given an integer, $n$, find and print the number of letter a's in the first $n$ letters of the infinite string.

**Example**

| `s`     | `n` | result |
| ------- | --- | ------ |
| 'abcac' | 10  | 4      |

**Constraints**

- $1 \leq |s| \leq 100$
- $1 \leq n \leq 10^{12}$
- For 25% of the test cases, $n \leq 10^{6}$

## Test suite 🧪

The test suite for this challenge covers the constraints described above and a happy path using the example's data. The tests are:

- `test_raises_ex`
- `test_happy_path`

For the full test suite, see [algorithm.spec.rb](./algorithm.spec.rb).

## Algorithm resolution description 📄

Algorithm resolution description

```ruby
def self.count_letters_a_in_sequence(pattern:, sequence_length:)
  repetitions = sequence_length / pattern.size
  rest = sequence_length % pattern.size
  total_for_repetitions = repetitions * pattern.chars.count { |c| c == "a" }
  total_for_remainder = pattern[0, rest].chars.count { |c| c == "a" }
  total_for_repetitions + total_for_remainder
end
```

The final code, including constraint validations, is available [here](./algorithm.rb).

## Samples 🥯

The samples used to run a quick sanity check on the implementation are:

```ruby
samples = [
  HackerRank.create_sample(expected_result: 4, params: ["abcabc", 10]),
  HackerRank.create_sample(expected_result: 4, params: ["abcab", 10]),
]
```

Which, after feeding it into our runner:

```ruby
HackerRank::Runner.new(samples).run do |pattern, sequence_length|
  HackerRank::Challenges.repeated_string(pattern, sequence_length)
end
```

Gives the following output:

```
➜ ruby repeated-string/index.rb
Running sample #1
Success! ✅
  0.000020   0.000008   0.000028 (  0.000023)
Running sample #2
Success! ✅
  0.000006   0.000005   0.000011 (  0.000012)
```

A good indicative that the solution looks reasonable.

## Implementation benchmarking & time complexity analysis 📈

Let's now take a look at this implementation and see how it stands from a performance point of view. Below, we have a code analysis and a benchmarking of the solution.

### Code analysis 🕵🏽‍♂️

Code analysis considerations

```ruby
def self.count_letters_a_in_sequence(pattern:, sequence_length:)
  repetitions = sequence_length / pattern.size
  rest = sequence_length % pattern.size
  total_for_repetitions = repetitions * pattern.chars.count { |c| c == "a" }
  total_for_remainder = pattern[0, rest].chars.count { |c| c == "a" }
  total_for_repetitions + total_for_remainder
end
```

Which translates to the following expression:

[expression breakdown]

Which means a **Constant** time complexity.

### Benchmarking 📊

To get a visual feeling of how the function behaves as $n$ increases, a benchmark was run from **BENCHMARK_N_ZERO** up to **BENCHMARK_N_MAX**, resulting in the following chart:

```console
➜ cat ./repeated-string/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                    Results
              ┌──────────────────────────────────────────────────┐
        0.002 │                                                  │
              │                                                  │
              │                                                  │
              │                                                  │
              │                                                  │
              │                                                  │
              │                                  , ,             │
   T(n)       │        |                         | |             │
              │      , |                         | |             │
              │      | |                         | |             │
              │      | |                         | |             │
              │      | |                         | |             │
              │      | |        ,                | |             │
              │      | |        |                | |          l  │
            0 │______]_L________1________________]_1__________@__│
              └──────────────────────────────────────────────────┘
              0                                      1000000000000
                                       n
```

Which, ignoring eventual CPU fluctuations, matches the given time complexity pattern theoretically demonstrated by the code analysis above.

For the full benchmarking code, see [benchmarking.rb](./benchmarking.rb).
