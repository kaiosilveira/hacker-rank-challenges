# Birthday cake candles

🚧 WORK IN PROGRESS 🚧

You are in charge of the cake for a child's birthday. You have decided the cake will have one candle for each year of their total age. They will only be able to blow out the tallest of the candles. Count how many candles are tallest.

**Function signature**

The signature that the challenge expects is `birthdayCakeCandles(candles) -> number_of_candles_that_are_tallest`. Where:

- params: `candles: Array<Integer>` -> Array of integers containing the candle heights
- returns: `number_of_candles_that_are_tallest: Integer` -> The number of candles that are tallest


**Constraints**

- $1 \leq n \leq 10^{5}$
- $1 \leq candles[i] \leq 10^{7}$

## Test suite

## Challenge resolution description

To solve this challenge, we first need to find the greatest number in the `candles` array:

```ruby
arr.max
```

And then count how many times it occurs:

```ruby
arr.count(arr.max)
```

And that's it!

## Samples

One single sample was provided for this challenge:

- `candles = [3, 2 ,1, 3]`, with the expected result being `2`.

We can feed this sample into our runner:

```ruby
samples = [
  HackerRank.create_sample(expected_result: 2, params: [[3, 2, 1, 3]]),
]

HackerRank::Runner.new(samples).run do |arr|
  HackerRank::Challenges.birthday_cake_candles(arr)
end
```

Which outputs:

```console
➜ ruby birthday-cake-candles/index.rb
Running sample #1
Success! ✅
```

Which is a good indicative that the solution looks reasonable.

## Implementation benchmarking & time complexity analysis

**Code analysis**
The code analysis here is pretty straightforward:

```ruby
arr.count( # O(1)
  arr.max # O(n)
)
```

The `arr.count` statement has `O(1)` as complexity in this case, as it does not depend on the size of the `candles` array, depending actually on the number of how many candles are tallest. Whereas the `arr.max` expression depends on the size of `n`, as the `.max` method will compare all items inside the array between each other.
With that said, the `T` expression can be written as:

- $T = O(1) + O(n)$

Which is equivalent to:

- $T = c_{1} + O(n)$

And after removing the constant term:

- $T = O(n)$

Concluding that the implementation has a `O(n)` time complexity.

**Benchmarking**
To benchmark this solution, a maximum size of `100_000` was used for the size of the `candles` array, with `10_000` separating each execution (please refer to [benchmarking.rb](./benchmark.rb) for implementation details). The results plotted in a chart below suggest a linear time complexity `O(n)`, which confirms the code analysis.

```console
➜ cat ./birthday-cake-candles/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                Results
          ┌──────────────────────────────────────────────────┐
        2 │                                                  │
          │                                                  │
          │                                                  │
          │                                                  │
          │                                              ._-/│
          │                                         ._r-"`   │
          │                                     _.-/`        │
   T(n)   │                                ._-/"             │
          │                           ._r-"`                 │
          │                       _r-"`                      │
          │                  ._-/"                           │
          │              _.-"`                               │
          │         ..-/"                                    │
          │    ..-/"`                                        │
        0 │_.-"`                                             │
          └──────────────────────────────────────────────────┘
          0                                             100000
                                   n
```
