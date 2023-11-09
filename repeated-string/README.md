# Challenge name

Challenge URL:

There is a string, $s$, of lowercase English letters that is repeated infinitely many times. Given an integer, $n$, find and print the number of letter **a**'s in the first $n$ letters of the infinite string.

**Example**

| `s`     | `n` | result |
| ------- | --- | ------ |
| 'abcac' | 10  | 4      |
| 'aba'   | 10  | 7      |

**Constraints**

- $1 \leq |s| \leq 100$
- $1 \leq n \leq 10^{12}$
- For 25% of the test cases, $n \leq 10^{6}$

## Test suite 🧪

The test suite for this challenge covers the constraints described above and two happy paths: one using the example's data and another one for a large sequence. For the full test suite, see [algorithm.spec.rb](./algorithm.spec.rb).

## Algorithm resolution description 📄

We surely don't want to create infinite strings (or strings as long as $10^5$, for that matter), so the main idea here is to use a trick: considering that we have to repeat the pattern and the desired sequence length, we can find the number of pattern repetitions by diving the sequence length by the length of the pattern string itself:

```ruby
repetitions = sequence_length / pattern.size
```

With that, we can simply count how many letters **a** exist in the pattern, and multiply it by the number of repetitions. We need to be careful when doing that, though, because the sequence length is not guaranteed to contain an exact number of repetitions for the pattern, so we need to consider the remainder as well, which is easily calculated:

```ruby
rest = sequence_length % pattern.size
```

With these two values in hand, we can simply find the total number of repetitions in the pattern:

```ruby
total_for_repetitions = repetitions * pattern.chars.count { |c| c == "a" }
```

And, then, the total number of repetitions in the remainder:

```ruby
total_for_remainder = pattern[0, rest].chars.count { |c| c == "a" }
```

And our final result will be:

```ruby
total_for_repetitions + total_for_remainder
```

Wrapping everything up, the resulting code is:

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
  HackerRank.create_sample(expected_result: 7, params: ["aba", 10]),
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
  0.000011   0.000004   0.000015 (  0.000012)
Running sample #2
Success! ✅
  0.000003   0.000002   0.000005 (  0.000004)
Running sample #3
Success! ✅
  0.000002   0.000002   0.000004 (  0.000005)
```

A good indication that the solution looks reasonable.

## Implementation benchmarking & time complexity analysis 📈

Let's now take a look at this implementation and see how it stands from a performance standpoint. Below, we have a code analysis and a benchmarking of the solution.

### Code analysis 🕵🏽‍♂️

To perform a time complexity analysis of our code, we can scan it from top to bottom, writing the big $O$ notation for each line (the code was slightly modified to allow for individual line comments):

```ruby
def self.count_letters_a_in_sequence(pattern:, sequence_length:)
  repetitions = sequence_length / pattern.size # O(1)
  rest = sequence_length % pattern.size # O(1)

  total_for_repetitions = repetitions * pattern.chars.count { |c| c == "a" } # O(1)
  total_for_remainder = pattern[0, rest].chars.count { |c| c == "a" } # O(1)

  total_for_repetitions + total_for_remainder # O(1)
end
```

Some considerations need to be made here before we move on, though:

- The fastest/widest varying term in our algorithm is the `sequence_length`, so it's going to be used as our $n$
- Although `Array#count` has $O(n)$, its $n$, in this case, is the size of the `pattern` string, which has a considerably small and controlled size ($1 \leq s \leq 100$) when compared to the range of possible sizes in `sequence_length` ($1 \leq n \leq 10^{12}$). Therefore, as `pattern.chars.count` doesn't depend on the sequence length, it's being considered $O(1)$

With that said, we can continue with the analysis. With the annotations, we can now write a time complexity equation out of the individual parts of the algorithm:

$T = O(1) + O(1) + O(1) + O(1) + O(1)$

Which can be reduced to:

$T = 5.O(1)$

And, finally, ignoring the constant:

$T = O(1)$

Therefore, our algorithm has a $O(1)$ (Constant) time complexity.

### Benchmarking 📊

To get a visual feeling of how the function behaves as $n$ increases, a benchmark was run from $1$ up to $1000000000000$, resulting in the following chart:

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
