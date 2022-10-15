# Picking Numbers

Challenge URL: https://www.hackerrank.com/challenges/picking-numbers/problem

Given an array of integers, find the longest sub-array where the absolute difference between any two elements is less than or equal to $1$.

**Example**

| array                       | expected result |
| --------------------------- | --------------- |
| [1, 1, 2, 2, 4, 4, 5, 5, 5] | 5               |
| [4, 6, 5, 3, 3, 1]          | 3               |
| [1, 2, 2, 3, 1, 2]          | 5               |

**Constraints**

- $2 \leq n \leq 100$
- $0 \leq a[i] \leq 100$
- The answer will be $\geq 2$

## Test suite

The test suite for this challenge covers the constraints described above and a happy path using the example's data. The happy path test is:

```ruby
def test_applies_the_pattern_correctly
  assert_equal 5, Algorithms.find_longest_sub_array(input_arr: [1, 1, 2, 2, 4, 4, 5, 5, 5])
  assert_equal 3, Algorithms.find_longest_sub_array(input_arr: [4, 6, 5, 3, 3, 1])
  assert_equal 5, Algorithms.find_longest_sub_array(input_arr: [1, 2, 2, 3, 1, 2])
end
```

For the full test suite, see [path_to_spec_file.spec.rb](./path_to_spec_file.rb).

## Algorithm resolution description 📄

To solve this challenge we need:

- a pointer to navigate the main `input_arr`, starting at the first position:

```ruby
current_pointer = 0
```

- iterate over the main `input_arr` and create a `sub_arr` containing the `current_pointer` value for each item:

```ruby
input_arr.each.with_index do |current_number, index|
  sub_arr = [current_number]
end
```

- iterate again over the `input_arr`, removing the current item being evaluated, and test each item against the `sub_arr` - if the absolute value of the difference is $\leq 1$, push it into the `sub_arr`:

```ruby
input_arr.reject.with_index{ |_, idx| index == idx }.each do |candidate|
  sub_arr << candidate if sub_arr.all? { |i| (i - candidate).abs <= 1 }
end
```

- increment the pointer after analyzing each item:

```ruby
current_pointer += 1
```

- set `max_sub_arr` to the current `sub_arr` if `sub_arr.size` is greater than or equal the `max_sub_arr.size`:

```ruby
max_sub_arr = sub_arr if sub_arr.size >= max_sub_arr.size
```

The final code looks like:

```ruby
def self.find_longest_sub_array(input_arr:)
  # constraint validation omitted for simplicity
  max_sub_arr = []

  current_pointer = 0
  input_arr.each.with_index do |current_number, index|
    sub_arr = [current_number]

    input_arr.reject.with_index{ |_, idx| index == idx }.each do |candidate|
      sub_arr << candidate if sub_arr.all? { |i| (i - candidate).abs <= 1 }
    end

    current_pointer += 1
    max_sub_arr = sub_arr if sub_arr.size >= max_sub_arr.size
  end

  max_sub_arr.size
end
```

The final code, including constraint validations, is available [here](./algorithm.rb).

## Samples 🥯

The samples used to run a quick sanity check on the implementation were the same provided by the examples:

```ruby
samples = [
  HackerRank.create_sample(expected_result: 5, params: [1, 1, 2, 2, 4, 4, 5, 5, 5]),
  HackerRank.create_sample(expected_result: 3, params: [4, 6, 5, 3, 3, 1]),
  HackerRank.create_sample(expected_result: 5, params: [1, 2, 2, 3, 1, 2]),
]
```

Which, after feeding it into our runner:

```ruby
HackerRank::Runner.new(samples).run do |*arr|
  HackerRank::Challenges.picking_numbers(arr)
end
```

Gives the following output:

```
➜ ruby ./picking-numbers/index.rb
Running sample #1
Success! ✅
  0.000046   0.000010   0.000056 (  0.000053)
Running sample #2
Success! ✅
  0.000035   0.000008   0.000043 (  0.000041)
Running sample #3
Success! ✅
  0.000042   0.000016   0.000058 (  0.000061)
```

A good indicative that the solution looks reasonable.

## Implementation benchmarking & time complexity analysis 📈

Let's now take a look at this implementation and see how it stands from a performance point of view. Below, we have a code analysis and a benchmarking of the solution.

### Code analysis 🕵🏽‍♂️

See below the code commented line by line with the time complexity analysis for each line. Notice that we have one loop nested inside the other.

```ruby
input_arr.each.with_index do |current_number, index| # n x block
  sub_arr = [current_number] # O(1)

  input_arr.reject.with_index{ |_, idx| index == idx }.each do |candidate| # m x block
    sub_arr << candidate if sub_arr.all? { |i| (i - candidate).abs <= 1 } # O(1)
  end

  current_pointer += 1 # O(1)
  max_sub_arr = sub_arr if sub_arr.size >= max_sub_arr.size # O(1)
end
```

We can translate the analysis above to the following expression:

$n.(O(1) + m.O(1) + O(1) + O(1))$

Which can be simplified as:

$n.m.O(1)$

As $n = m -1$, for large enough inputs we can say that $n \approx m$. Therefore:

$n.m.O(1) \approx O(1).n^{2}$

As we are only interested in the fastest growing term, we can say that the time complexity $T$ for this implementation is:

$T = O(n^2)$

Which means a **Quadratic** time complexity.

### Benchmarking 📊

To get a visual feeling of how the function behaves as $n$ increases, a benchmark was run using $n = 1$ up to $n = 1000$, where $n$ is the size of the input array. The results are plotted in the following chart:

```console
➜ cat ./picking-numbers/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                  Results
            ┌──────────────────────────────────────────────────┐
        0.3 │                                                  │
            │                                                  │
            │                                                  │
            │                                                  │
            │                                                 .│
            │                                              .r/`│
            │                                            ./`   │
   T(n)     │                                         _-"`     │
            │                                     ../"         │
            │                                  ../`            │
            │                              ..-"`               │
            │                          ..-/`                   │
            │                     _.-/"`                       │
            │              ._.-/""                             │
          0 │_______r--^/""`                                   │
            └──────────────────────────────────────────────────┘
            0                                               1000
                                     n
```

Which, ignoring eventual CPU fluctuations, matches the given time complexity pattern theoretically demonstrated by the code analysis above.

For the full benchmarking code, see [benchmarking.rb](./benchmarking.rb).
