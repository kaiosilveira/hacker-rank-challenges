# Staircase

Given an integer $n$, we should draw a staircase using hashes (#) with the number of lines in the output matching the size of $n$.

**Example**

$n = 4$

```
   #
  ##
 ###
####
```

The last line does not contain any spaces, the lines above contains more and more spaces up to only one item in the stair.

**Constraints**

- $0 \leq n \leq 100$

## Test suite

The test suite for this challenge implements validations for the constraints described above as well as a test to make sure that the function `draw_n_tokens` returns the correct type and length of the token provided. The tests are:

- `test_raises_an_exception_if_n_is_lower_than_0`
- `test_raises_exception_if_n_is_greater_than_100_and_constraint_enforcement_is_enabled`
- `test_does_not_raise_an_exception_if_n_is_greater_than_100_and_constraint_enforcement_is_disabled`
- `test_returns_the_correct_number_of_tokens`

For the full test suite, please see [draw_n_tokens.spec.rb](./draw_n_tokens.spec.rb).

## Algorithm resolution description

The algorithm implementation is straightforward. We first create a range starting from zero and up to `n`:

```ruby
(0..n)
```

Then we create an array from the range, so we can use `.map`:

```ruby
(0..n).to_a
```

Then, we map over all the items returning the given token:

```ruby
(0..n).to_a.map { |n| token }
```

Finally, we `join` the output of the map operation:

```ruby
(0..n).to_a.map { |n| token }.join('')
```

This provides us enough ground to build any sequence of tokens for one row. This logic is wrapped inside `Algorithms.draw_n_tokens` so we can reuse it later:

```ruby
module HackerRank
  module Algorithms
    def self.draw_n_tokens(n, token)
      (0..n).to_a.map { |n| token }.join('')
    end
  end
end
```

Now, each row of the staircase can be defined as `row = offset + steps`. We can model this in the code for a given `n` as:

```ruby
offset = Algorithms.draw_n_tokens(n: n - 1, token: ' ')
steps = Algorithms.draw_n_tokens(n: sequence.size - n - 1, token: '#')
row = offset + steps
```

Now, we only need to run this block of code repeatedly for each level of the stair. We can accomplish that by creating a sequence:

```ruby
sequence = (0...n).to_a
```

And iterating over the reserve of it:

```ruby
sequence.reverse.each do |n|
  offset = Algorithms.draw_n_tokens(n: n - 1, token: ' ')
  steps = Algorithms.draw_n_tokens(n: sequence.size - n - 1, token: '#')
  row = offset + steps
  puts row
end
```

The final implementation can be seen at [challenge.rb](./challenge.rb).

## Samples

The samples used to run a quick sanity check on the implementation are:

```ruby
samples = [
  HackerRank.create_sample(expected_result: ['#'], params: 1),
  HackerRank.create_sample(
    expected_result: [
      ' #',
      '##'
    ],
    params: 2
  ),
  HackerRank.create_sample(
    expected_result: [
      '    #',
      '   ##',
      '  ###',
      ' ####',
      '#####',
    ],
    params: 5
  )
]
```

Which, after feeding it into our runner:

```ruby
HackerRank::Runner.new(samples).run do |n|
  HackerRank::Challenges.staircase(n)
end
```

Gives the following output:

```
➜ ruby ./staircase/index.rb
Running sample #1
#
Success! ✅
  0.000027   0.000012   0.000039 (  0.000035)
Running sample #2
 #
##
Success! ✅
  0.000021   0.000014   0.000035 (  0.000035)
Running sample #3
    #
   ##
  ###
 ####
#####
Success! ✅
  0.000047   0.000032   0.000079 (  0.000079)
```

A good indicative that the solution looks reasonable.

## Implementation benchmarking & time complexity analysis

Let's now take a look at this implementation and see how it stands from a performance point of view. Below, we have a code analysis and a benchmarking of the solution.

### Code analysis

To analise the time complexity of this implementation we will need to break the code down into smaller and more verbose pieces. See below the rewritten solution with a time complexity notation for each line:

```ruby
def self.draw_n_tokens(n, token)
  range = (0..n) # O(1)
  range_as_array = range.to_a # O(1)

  result = range_as_array.map do # n x block
    token # O(1)
  do

  result.join('')  # O(1)
end
```

Which translates to the following expression:

$O(1) + O(1) + n.(O(1)) + O(1)$

That can be simplified as:

$3.O(1) + n.(O(1))$

As we have a term being multiplied by $n$ and we are only interested in the order of magnitude of the time complexity, we can ignore the constant term $3.O(1)$, which leaves us with:

$n.(O(1))$

By the same logic, we can say that by multiplying $n$ by a constant we would have the same order of magnitude, so we can say that the time complexity $T$ is in the order of $n$ for the implementation:

$T = O(n)$

Which means a linear time complexity.

### Benchmarking

To visually confirm the results proposed above, a benchmark was run from $n = 1$ up to $n = 100000$, resulting in the following chart:

```console
➜ cat ./staircase/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
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

Which, ignoring eventual CPU fluctuations, matches the linear pattern calculated by the code analysis.
