# hacker-rank-left-rotation

A left rotation operation on an array of size `n` shifts each of the array's elements `1` unit to the left. Given an integer, `d`, rotate the array that many steps left and return the result.

**Constraints**

- $1 \leq n \leq 10^5$
- $1 \leq d \leq n$
- $1 \leq a[i] \leq 10^6$

## Test suite

The test suite for this challenge covers the constraints mentioned above and also contains a happy path using `arr = [1, 2, 3, 4, 5]` and `offset = 2`, which has the expected result as being `[3, 4, 5, 1, 2]`.

The tests are:

- `test_raises_exception_if_the_offset_value_is_less_than_1`
- `test_raises_exception_if_the_offset_value_is_greater_than_array_size`
- `test_raises_exception_if_the_input_array_has_more_than_100_000_items`
- `test_raises_exception_if_the_input_array_has_less_than_1_item`
- `test_shifts_the_elements_d_positions_to_the_left`

For implementation details, see [the full test suite](./perform_left_rotation.spec.rb).

## Algorithm resolution description

To solve this problem, we can .map the given input array to a new one in the form `arr[n] -> new_arr[n + d]`, for any given `d`. To kick this solution off, we start by setting up a range from `0` up to the number of items in the input array:

```ruby
  (0..arr.size - 1)
```

Then we map over it:

```ruby
  (0..arr.size - 1).map { |n| arr[(n + d)] }
```

The problem with the code above, though, is that it will throw an `RangeError` when we try to access `n + d` near the last positions of the input array. To overcome this problem, we resort to the module operator `%`, which will create a circular number structure, shuffling the result of the sum back to the initial numbers inside of the range of the array. The final code looks like this:

```ruby
  (0..arr.size - 1).map { |n| arr[(n + d) % arr.size] }
```

## Samples

The challenge gives us a single sample:

| d   | arr             | expected result |
| --- | --------------- | --------------- |
| 2   | [1, 2, 3, 4, 5] | [3, 4, 5, 1, 2] |

We can feed it into our runner:

```ruby
samples = [
  HackerRank::Samples.create_sample(expected_result: [3, 4, 5, 1, 2], params: [2, [1, 2, 3, 4, 5]]),
]

HackerRank::Runner.new(samples).run do |*params|
  d, arr = params
  HackerRank::Challenges.left_rotation(d, arr)
end
```

Which outputs:

```console
➜ ruby left-rotation/index.rb
Running sample #1
Success! ✅
```

Which is a good indicative that everything is fine.

## Implementation benchmarking & algorithm complexity analysis

To calculate the computational time complexity for this implementation we can decompose the code parts, analyze them separately and then sum the results.

- `(0..arr.size - 1)` is $O(1)$, i.e., has a constant time complexity, as it's just creating a range from 0 up to the number of elements inside `arr`;
- `.map { |n| arr[(n + d) % arr.size] }` is $n.O(1)$, as the code inside the `.map` function will run one time for each $n$.

So, the resulting expression for the time complexity in relation to `n`:

- $T = O(1) + n x O(1)$

Getting rid of the constants and coefficients we have that:

- $T = O(n)$

i.e., the implementation has Linear time complexity.

**Benchmarking**

To benchmark this implementation, an arbitrary `d = 2` was chosen and 100.000 arrays were created and passed to `perform_left_rotation` to measure the results. Each array had `i` items, with `i` ranging from `0` up to the hard limit mentioned by Hacker Rank for this challenge: `10^5`. The results were aggregated and a `csv` file was created off of them, with a space of 2500 items between entries. Below, the results confirm a pretty clear indication of a linear correlation between the input array size (`n`) and the amount of time it takes to perform the operation (`T(n)`), indicating a complexity in the order of `O(n)`.

```console
➜ cat ./left-rotation/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                   Results
             ┌──────────────────────────────────────────────────┐
        0.02 │                                                  │
             │                                                  │
             │                                                  │
             │                                                  │
             │                                                , │
             │                                                /\│
             │                                               . |│
   T(n)      │                                         .r./""`  │
             │                                     __/"`        │
             │                            ._.--"`-/             │
             │                        _.--`                     │
             │                   r/"""                          │
             │             .r""/"                               │
             │     _.__--""`                                    │
           0 │__--" `                                           │
             └──────────────────────────────────────────────────┘
             0                                             100000
                                      n

```

For the implementation details, see [benchmarking.rb](./benchmarking.rb).
