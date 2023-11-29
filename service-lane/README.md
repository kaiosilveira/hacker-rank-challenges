# Challenge name

Challenge URL: https://www.hackerrank.com/challenges/service-lane/problem

A driver is driving on the freeway. The check engine light of his vehicle is on, and the driver wants to get service immediately. Luckily, a service lane runs parallel to the highway. It varies in width along its length.

You will be given an array of widths at points along the road (indices), then a list of the indices of entry and exit points. Considering each entry and exit point pair, calculate the maximum size vehicle that can travel that segment of the service lane safely.

**Example**

| array with lane widths | (entry, exit) pairs                    | Expected result |
| ---------------------- | -------------------------------------- | --------------- |
| 2, 3, 2, 1             | [1, 2], [2, 4]                         | 2, 1            |
| 2, 3, 1, 2, 3, 2, 3, 3 | [0, 3], [4, 6], [6, 7], [3, 5], [0, 7] | 1, 2, 3, 2, 1   |

**Constraints**

- $2 \leq n \leq 100000$
- $1 \leq t \leq 1000$
- $0 \leq i < j < n$
- $2 \leq j - i + 1 \leq min(n, 1000)$
- $1 \leq width[k] \leq 3$, where $0 \leq k < n$

## Test suite 🧪

The test suite for this challenge covers the constraints described above and a happy path using the example's data. For the full test suite, see [challenge.spec.rb](./challenge.spec.rb) and [algorithm.spec.rb](./algorithm.spec.rb).

## Algorithm resolution description 📄

To solve this challenge, we need to find the narrowest subsection of the service lane, considering the entry and exit points provided, and use that as our result. The idea, then, is:

- for each entry + exit points:
  - iterate through each point
  - find the subsection of the service lane for each point
  - return the minimum width of the subsection
- aggregate and return the results

The above statement, converted into code, looks like:

```ruby
def self.find_minimum_values_in_slices(arr:, slices:)
  return [] unless arr.any?
  return [] unless slices.any?
  slices.map { |first, last| arr.slice(first..last).min }
end
```

The final code, including constraint validations, is available [here](./algorithm.rb).

## Samples 🥯

The samples used to run a quick sanity check on the implementation are:

```ruby
samples = [
  HackerRank.create_sample(
    expected_result: [2, 1],
    params: [[2, 3, 2, 1], [[1, 2], [2, 4]]],
  ),
  HackerRank.create_sample(
    expected_result: [1, 2, 3, 2, 1],
    params: [[2, 3, 1, 2, 3, 2, 3, 3], [[0, 3], [4, 6], [6, 7], [3, 5], [0, 7]]],
  ),
]
```

Which, after feeding it into our runner:

```ruby
HackerRank::Runner.new(samples).run do |*params|
  input, cases = params
  HackerRank::Challenges.service_lane(input, cases)
end
```

Gives the following output:

```
➜ ruby service-lane/index.rb
Running sample #1
Success! ✅
  0.000018   0.000003   0.000021 (  0.000019)
Running sample #2
Success! ✅
  0.000006   0.000003   0.000009 (  0.000010)
```

A good indication that the solution looks reasonable.

## Code metrics 📈

Let's now take a look at this implementation and see how it stands from a performance point of view. Below, we have a time complexity analysis and a benchmarking of the solution.

### Time complexity analysis 🕵🏽‍♂️

To perform a time complexity analysis of our code, we can scan it from top to bottom, writing the big $O$ notation for each line (the code was slightly modified to allow for individual line comments). Being `n` the length of our `slices` (entry+exit points) and `m` the length of our `arr` (service lane widths):

```ruby
slices.map do |first, last| # O(n)
  subsection = arr.slice(first..last) # O(m)
  subsection.min # O(m)
end
```

Which translates to the following expression:

$T = O(n).(O(m) + O(m)) \implies T = O(n).2O(m) \implies T = 2O(n.m)$, which, ignoring constants, becomes:

$T = O(n.m)$

Which is reasonable, considering that we have two sources of possible length variation here:

- the service lane width
- the number of entry+exit points provided

### Benchmarking 📊

To get a visual feeling of how the function behaves as $n$ and $m$ increases, a benchmark was set up to make each variable change in isolation. For the size of the array containing the service lane widths, we have:

```console
➜ cat service-lane/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                    Results
              ┌──────────────────────────────────────────────────┐
        0.003 │                                                  │
              │                                                _r│
              │                                           .__@@@@│
              │                                      | ._@@@@T"` │
              │                                    ._@@@@TT"     │
              │                                ._r@@@@T`         │
              │                             _r@@@@T"             │
   T(n)       │                         ._r@@@T"`                │
              │                  .  __r@@@T"`                    │
              │                 .1r@@@T"`                        │
              │             .__@@@T`                             │
              │          __@@T""                                 │
              │      ,_@@T/`                                     │
              │,._r@@T"`                                         │
            0 │@@T"                                              │
              └──────────────────────────────────────────────────┘
              0                                              10000
                                       n
```

And for the size of entry+exit points, we have:

```console
➜ cat ./result_slices.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                   Results
             ┌──────────────────────────────────────────────────┐
        0.06 │                             |                    │
             │                             |                    │
             │                             |                    │
             │                             |                    │
             │                             |                    │
             │                             |                    │
             │                             |                    │
   T(n)      │                             |                    │
             │                             |                    │
             │           |                 |    ,               │
             │           |                 |    |    .          │
             │           |                 @  .,|    | |   ,.   │
             │         , |                 @  |||  . l.|., ||. .│
             │    . .. ]_1__________r@_rrrr@r@@@@@@^^TTTTTTTTTTT│
           0 │@T"""""""""""""""""                               │
             └──────────────────────────────────────────────────┘
             0                                               5000
                                      n
```

Note how the processing time increases linearly in both cases, proving that our algorithm is between the linear and quadratic complexity ranges.

For the full benchmarking code, see [benchmarking.rb](./benchmarking.rb).
