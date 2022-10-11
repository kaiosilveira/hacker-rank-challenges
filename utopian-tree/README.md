# Utopian tree

Challenge URL: https://www.hackerrank.com/challenges/utopian-tree/problem

The Utopian Tree goes through 2 cycles of growth every year. Each spring, it doubles in height. Each summer, its height increases by 1 meter.

A Utopian Tree sapling with a height of 1 meter is planted at the onset of spring. How tall will the tree be after $n$ growth cycles?

**Example**

If the number of growth cycles is $n = 5$, the calculations are as follows:

| Period | Height |
| ------ | ------ |
| 0      | 1      |
| 1      | 2      |
| 2      | 3      |
| 3      | 6      |
| 4      | 7      |
| 5      | 14     |

**Constraints**

- $0 \leq n \leq 60$

## Test suite

The test suite for this challenge contains tests covering the constraints described above and a happy path confirming that the pattern to solve the challenge is being applied correctly:

- `test_raises_an_exception_if_number_of_cycles_is_lower_than_1`
- `test_raises_an_exception_if_number_of_cycles_is_greater_than_60_and_constraint_enforcement_is_enabled`
- `test_does_not_raise_an_exception_if_number_of_cycles_is_greater_than_60_and_constraint_enforcement_is_disabled`
- `test_applies_the_growth_pattern_correctly`

For the full test suite, see [calculate_utopian_tree_height.spec.rb](./calculate_utopian_tree_height.spec.rb).

## Algorithm resolution description

To solve this challenge, we can start by the simplest case where the number of growth cycles $n = 1$. In this case, we can simply return the initial height 1.

```ruby
def self.calculate_utopian_tree_height(number_of_cycles:)
  result = 1
  result
end
```

Now, for the other cases, we can create a range starting at 1 and going up to the number of cycles.

```ruby
(1..number_of_cycles)
```

Then, we can iterate over each element in this range and apply the following pattern:

- in every even-numbered cycle, the tree grows 1 meter
- in every odd-numbered cycle, the tree doubles its height

The final logic looks like:

```ruby
def self.calculate_utopian_tree_height(number_of_cycles:)
  result = 1

  (1..number_of_cycles).each do |current_cycle|
    result += 1 if current_cycle.even?
    result *= 2 if current_cycle.odd?
  end

  result
end
```

The final code, including constraint validations, is available [here](./calculate_utopian_tree_height.rb).

## Samples

The samples used to run a quick sanity check on the implementation are the same as the one described in the table above:

```ruby
samples = [
  HackerRank::Samples.create_sample(expected_result: 2, params: 1),
  HackerRank::Samples.create_sample(expected_result: 3, params: 2),
  HackerRank::Samples.create_sample(expected_result: 6, params: 3),
  HackerRank::Samples.create_sample(expected_result: 7, params: 4),
  HackerRank::Samples.create_sample(expected_result: 14, params: 5),
]
```

Which, after feeding it into our runner:

```ruby
HackerRank::Runner.new(samples).run do |n|
  HackerRank::Challenges.utopian_tree(n)
end
```

Gives the following output:

```console
➜ ruby ./utopian-tree/index.rb
Running sample #1
Success! ✅
  0.000017   0.000007   0.000024 (  0.000021)
Running sample #2
Success! ✅
  0.000007   0.000004   0.000011 (  0.000010)
Running sample #3
Success! ✅
  0.000006   0.000004   0.000010 (  0.000009)
Running sample #4
Success! ✅
  0.000007   0.000003   0.000010 (  0.000010)
Running sample #5
Success! ✅
  0.000005   0.000003   0.000008 (  0.000008)
```

A good indicative that the solution looks reasonable.

## Implementation benchmarking & time complexity analysis

Let's now take a look at this implementation and see how it stands from a performance point of view. Below, we have a code analysis and a benchmarking of the solution.

### Code analysis

The code analysis for this challenge is straightforward. Variable assignments and return statements were left out for simplicity:

```ruby
(1..number_of_cycles).each do |current_cycle| # n x block
  result += 1 if current_cycle.even? # O(1)
  result *= 2 if current_cycle.odd? # O(1)
end
```

Which translates to the following expression:

$n.(O(1) + O(1))$

That can be simplified to:

$2.O(1).n$

As $2.O(1)$ is constant and we are interested only in the fastest-growing term, we can say that the time complexity $T$ for this function is in the order of $n$:

$T = O(n)$

Which means a linear time complexity.

### Benchmarking

To visually confirm the results proposed above, a benchmark was run from $n = 1$ up to $n = 100000$, resulting in the following chart:

```console
➜ cat ./utopian-tree/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                  Results
            ┌──────────────────────────────────────────────────┐
        0.2 │                                                  │
            │                                                  │
            │                                                  │
            │                                               ,. │
            │                                           \.\./"`│
            │                                         ..//``   │
            │                                       r_^|`      │
   T(n)     │                                  \ rr,`          │
            │                               .,r|\| '           │
            │                            .rL/Y`                │
            │                         r-,/ '                   │
            │                     _//"` |                      │
            │               ._r/TT                             │
            │        .__,--/`                                  │
          0 │____,--/`                                         │
            └──────────────────────────────────────────────────┘
            0                                             100000
                                     n
```

Which, ignoring eventual CPU fluctuations, matches the given time complexity pattern demonstrated by the code analysis.

For the full benchmarking code, see [benchmarking.rb](./benchmarking.rb).
