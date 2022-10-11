# Challenge name

Challenge URL:

Challenge description

**Example**

Example here

**Constraints**

- constraint 1
- constraint 2

## Test suite

Testing approach and description

- `test_that_does_something_1`
- `test_that_does_something_2`

For the full test suite, please see [path_to_spec_file.spec.rb](./path_to_spec_file.rb).

## Algorithm resolution description

Algorithm resolution description

```ruby
# some ruby code here
```

The final code, including constraint validations, is available [here](./path_to_file.rb).

## Samples

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

A good indicative that the solution looks reasonable.

## Implementation benchmarking & time complexity analysis

Let's now take a look at this implementation and see how it stands from a performance point of view. Below, we have a code analysis and a benchmarking of the solution.

### Code analysis

Code analysis considerations

```ruby
# some code here
```

Which translates to the following expression:

[expression breakdown]

Which means **CONSTANT|LINEAR|QUADRATIC** time complexity.

### Benchmarking

To visually confirm the results proposed above, a benchmark was run from **BENCHMARK_FROM** up to **BENCHMARK_TO**, resulting in the following chart:

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

Which, ignoring eventual CPU fluctuations, matches the given time complexity pattern calculated by the previous code analysis.

For the full benchmarking code, see [benchmarking.rb](./benchmarking.rb).
