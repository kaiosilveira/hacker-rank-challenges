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

## Test suite ๐งช

The test suite for this challenge covers the constraints described above and a happy path using the example's data. The tests are:

- `test_raises_ex`
- `test_happy_path`

For the full test suite, see [algorithm.spec.rb](./algorithm.spec.rb).

## Algorithm resolution description ๐

Algorithm resolution description

```ruby
# some ruby code here
```

The final code, including constraint validations, is available [here](./algorithm.rb).

## Samples ๐ฅฏ

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
โ ruby ./challenge/index.rb

challenge output
```

A good indicative that the solution looks reasonable.

## Implementation benchmarking & time complexity analysis ๐

Let's now take a look at this implementation and see how it stands from a performance point of view. Below, we have a code analysis and a benchmarking of the solution.

### Code analysis ๐ต๐ฝโโ๏ธ

Code analysis considerations

```ruby
# some code here
```

Which translates to the following expression:

[expression breakdown]

Which means **CONSTANT|LINEAR|QUADRATIC** time complexity.

### Benchmarking ๐

To get a visual feeling of how the function behaves as $n$ increases, a benchmark was run from **BENCHMARK_N_ZERO** up to **BENCHMARK_N_MAX**, resulting in the following chart:

```console
โ cat ./challeng/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                   Results
             โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ
        0.03 โ                                                  โ
             โ                                                  โ
             โ                                                  โ
             โ                                                  โ
             โ                                            ..    โ
             โ                                            ||    โ
             โ                                            ||    โ
   T(n)      โ                                            /\    โ
             โ                                           .|lr--/โ
             โ                                     _.--/"`      โ
             โ                             .__r-`/"             โ
             โ                      /__\^/"`                    โ
             โ              .__--/""`                           โ
             โ       ..\r-""`                                   โ
           0 โ__r-/""`                                          โ
             โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ
             0                                             100000
                                      n
```

Which, ignoring eventual CPU fluctuations, matches the given time complexity pattern theoretically demonstrated by the code analysis above.

For the full benchmarking code, see [benchmarking.rb](./benchmarking.rb).
