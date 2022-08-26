# Sub array division

Challenge URL: https://www.hackerrank.com/challenges/the-birthday-bar/problem

Two children, Lily and Ron, want to share a chocolate bar. Each of the squares has an integer on it.
Lily decides to share a contiguous segment of the bar selected such that:

- The length of the segment matches Ron's birth month, and,
- The sum of the integers on the squares is equal to his birth day.

Determine how many ways she can divide the chocolate.

**Constraints**

- $1 \leq n \leq 100$
- $1 \leq s[i] \leq 5$, where ( $0 \leq i < n$ )
- $1 \leq d \leq 31$
- $1 \leq m \leq 12$

## Test suite

A test suite was added to make sure the constraints above are being followed. The tests are:

- `test_returns_zero_if_chocolate_array_is_empty`
- `test_raises_an_exception_if_birth_day_is_smaller_than_one`
- `test_raises_an_exception_if_birth_day_is_greater_than_thirty_one`
- `test_raises_an_exception_if_birth_month_is_smaller_than_one`
- `test_raises_an_exception_if_birth_month_is_greater_than_twelve`
- `test_raises_an_exception_if_array_size_is_greater_than_100_and_the_constrain_flag_is_disabled`
- `test_executes_if_array_length_is_greater_than_100_and_the_constrain_flag_is_enabled`

The actual implementation can be seen at [select-chocolate-slices-mathing-criteria.spec.rb](./select-chocolate-slices-matching-criteria.spec.rb)

## Challenge resolution description

To solve this challenge we need to visit every element inside of the `chocolate` array, creating a sub-array out of it starting from the current item and with the length of the birth month. This was addressed with the code below:

```ruby
  chocolate.filter.with_index do |_, index|
      slice = chocolate.slice(index, birth_month)
      ...
  end
```

Note: We are using `.filter` here as a trick, because it will only return the items that evaluates to true, which will be important later.

Continuing with the implementation, we need to sum the items each slice to check whether it matches the birth day or not.

```ruby
  chocolate.filter.with_index do |_, index|
    slice = chocolate.slice(index, birth_month)
    slice.sum == birth_day
  end
```

Finally, we only care about the number of slices that evaluated to true, so we can simply call `.size` in the resulting expression:

```ruby
  chocolate.filter.with_index do |_, index|
    slice = chocolate.slice(index, birth_month)
    slice.sum == birth_day
  end.size
```

And that's it!

## Samples

Three samples were provided by the challenge description:

| s (chocolate)      | d (birth_day) | m (birth_month) | expected result |
| ------------------ | ------------- | --------------- | --------------- |
| [2, 2, 1, 3, 2]    | 4             | 2               | 2               |
| [1, 2, 1, 3, 2]    | 3             | 2               | 1               |
| [1, 1, 1, 1, 1, 1] | 3             | 2               | 1               |

We can feed this data into our runner:

```ruby
  samples = [
    HackerRank.create_sample(expected_result: 2, params: [4, 2, [2, 2, 1, 3, 2]]),
    HackerRank.create_sample(expected_result: 1, params: [4, 2, [1, 2, 1, 3, 2]]),
    HackerRank.create_sample(expected_result: 0, params: [3 , 2, [1, 1, 1, 1, 1, 1]]),
  ]

  HackerRank::Runner.new(samples).run do |d, m, arr|
    HackerRank::Challenges.birthday(d, m, arr)
  end
```

Which outputs:

```console
  ➜ ruby ./sub-array-division/index.rb
  Running sample #1
  Success! ✅
  Running sample #2
  Success! ✅
  Running sample #3
  Success! ✅
```

A good indicative that the solution looks reasonable.

## Implementation benchmarking & time complexity analysis

**Code analysis**
Below, the code analysis for the implementation, adding a comment on each line that adds to the time complexity expression:

```ruby
  chocolate.filter.with_index do |_, index| # n x block
    slice = chocolate.slice(index, birth_month) # O(1)
    slice.sum == birth_day # O(1)
  end.size
```

Note: It can be a surprise, but `slice.sum` is actually `O(1)` here, as the `slice` size will depend on the `birth_month` variable, not on the size of the `chocolate` array.

With this analysis, we can write `T` as:

- $T = n.O(1) + O(1)$

Which, removing the constants, is:

- $T = n.O(1)$

And as `O(1)` is a constant coefficient multiplying `n` here, we can say that

- $T = O(n)$

i.e., the implementation has a Linear time complexity.

**Benchmarking**

To benchmark this solution we varied `n` from `n = 0` up to `n = 100_000`, with a step size of `1000` items increase for each run. The values for `birth_day` and `birth_month` were kept constant, as they do not impact the time complexity of the function. The chart results are shown below:

```console
➜ cat ./sub-array-division/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                Results
          ┌──────────────────────────────────────────────────┐
        2 │                                                  │
          │                                                  │
          │                                                  │
          │                                                 _│
          │                                             ..-" │
          │                                         _r-"`    │
          │                                    _.-/"         │
   T(n)   │                               ._-/"              │
          │                           _.-"`                  │
          │                      ._r/"                       │
          │                  ..-/`                           │
          │             ._r/"`                               │
          │         _.-/`                                    │
          │    ._-/"                                         │
        0 │_.-"`                                             │
          └──────────────────────────────────────────────────┘
          0                                             100000
                                   n
```

For the implementation details, see [benchmarking.rb](./benchmarking.rb).
