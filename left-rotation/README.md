# hacker-rank-left-rotation

A left rotation operation on an array of size **_n_** shifts each of the array's elements **_1_** unit to the left. Given an integer, **_d_**, rotate the array that many steps left and return the result.

**Constraints**

- $1 \leq n \leq 10^5$
- $1 \leq d \leq n$
- $1 \leq a[i] \leq 10^6$

## Test suite

A simple [test suite](./left-rotation.spec.rb) was put in place for this example. It simply checks that for a given `arr = [1, 2, 3, 4, 5]` and `d = 2`, the expected result is `[3, 4, 5, 1, 2]`. Which is enough to validate that:

- all elements are being shifted the expected number of positions
- overflowing elements are being added to the beginning instead of causing an error

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

## Implementation benchmarking & algorithm complexity analysis

To calculate the computational time complexity for this implementation we can decompose the code parts, analyze them separately and then sum the results.

- `(0..arr.size - 1)` is `O(1)`, i.e., has a constant time complexity, as it's just creating a range from 0 up to the
  number of elements inside `arr`;
- `.map { |n| arr[(n + d) % arr.size] }` is `n x O(1)`, as the code inside the `.map` function will run one time for each `n`.

So, the resulting expression for the time complexity in relation to `n` is `T = O(1) + n x O(1)`. Getting rid of the constants and coefficients we have `T = O(n)`.

**Benchmarking**

To benchmark this implementation, an arbitrary `d = 2` was chosen and 100.000 arrays were created and passed to `perform_left_rotation` to measure the results. Each array had `i` items, with `i` ranging from `0` up to the hard limit mentioned by Hacker Rank for this challenge: `10^5`. The results were aggregated and a `csv` file was created off of them, with a space of 2500 items between entries.
Below, the results confirm a pretty clear indication of a linear correlation between the input array size (`n`) and the amount of time it takes to perform the operation (`T(n)`), indicating a complexity in the order of `O(n)`.

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
