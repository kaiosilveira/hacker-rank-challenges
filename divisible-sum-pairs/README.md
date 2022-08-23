# Divisible sum pairs

Given an array of integers and a positive integer $k$, determine the number of $(i,j)$ pairs where $i < j$ and $ar[i] + ar[j]$ is divisible by $k$.

**Constraints**

- $2 \leq n \leq 100$
- $1 \leq k \leq 100$
- $1 \leq ar[i] \leq 100$

## Test suite

The test suite for this implementation uses the example provided by Hacker Rank and basically asserts that the expected result is returned for a given input. The values used are:

- $k = 3$
- $arr = [1, 3, 2, 6, 1, 2]$
- expected result: $5$

And the five pairs that match the requirements for this array are:

- $(0, 2) \to arr[0] + arr[2] = 1 + 2 = 3$
- $(0, 5) \to arr[0] + arr[5] = 1 + 2 = 3$
- $(1, 3) \to arr[1] + arr[3] = 3 + 6 = 9$
- $(2, 4) \to arr[2] + arr[4] = 2 + 1 = 3$
- $(4, 5) \to arr[4] + arr[5] = 1 + 2 = 3$

For implementation details, see [get-divisible-sum-pairs.spec.rb](./get-divisible-sum-pairs.spec.rb).

## Algorithm resolution description

The strategy to complete this challenge is to visit every position of the given `arr`, and for each position, we need to execute the required expression comparing it to all other positions in the array. Then, we just need to store the pairs that match the criteria and return how many sizes are there.

We start by declaring our `pairs` array, which will be just an aggregator for the pairs matching the criteria:

```ruby
  pairs = []
```

Then, we move on to scan every position in the array. We do that by creating a range and calling `.each` on it:

```ruby
  (0..arr.size-1).each do |i|
```

And then, for each `i`, we need to scan the array again to search for the pairs:

```ruby
  (0..arr.size-1).each do |j|
```

and now finally we can execute the expression and aggregate the matching pairs:

```ruby
  pairs << [arr[i], arr[j]] if i < j && (arr[i] + arr[j]).remainder(k) == 0
```

Note that we are pushing to `pairs` only if the expression is evaluated to `true`.

Last but not least, we need to return the number of pairs:

```ruby
  pairs.size
```

And we are done! The final structure looks like:

```ruby
  def get_divisible_sum_pairs(arr:, k:)
    pairs = []

    (0..arr.size-1).each do |i|
      (0..arr.size-1).each do |j|
        pairs << [arr[i], arr[j]] if i < j && (arr[i] + arr[j]).remainder(k) == 0
      end
    end

    pairs.size
  end
```

## Implementation benchmarking & time complexity analysis

**Code analysis**

```ruby
  def get_divisible_sum_pairs(arr:, k:)
    pairs = [] # O(1)

    (0..arr.size-1).each do |i| # n
      (0..arr.size-1).each do |j| # m
        pairs << [arr[i], arr[j]] if i < j && (arr[i] + arr[j]).remainder(k) == 0 # O(1)
      end
    end

    pairs.size # O(1)
  end
```

The `T` expression for this code can be written as:

- $T = O(1) + n.(m.O(1)) + O(1) \implies T = n.m.O(1) + 2.O(1)$

Considering that we will be running the outer loop `n` times, with `n` being `arr.size - 1` and the same will happen for the inner loop, with it being run `m` times, with `m` also being `arr.size - 1`, we can say that `m = n = arr.size - 1` and we can rewrite `T` as:

- $T = n^{2}.O(1) + 2.O(1)$

Now, considering `O(1)` is constant, `T` is equivalent to:

- $T = c_{1}.n^{2} + c_{2}$

And finally, getting rid of the constants, we have that `T` is in the order of `n^{2}`, so we can say that this function has exponential time complexity `O(n^{2})`.

**Benchmarking**

To visually see what the code analysis stated above, a benchmarking with a maximum size for the array `arr` of `20000` was performed, which is way above the constraint for the size of `n` imposed by the challenge, which was 100. The results are plotted in the chart below, showing an exponential curve.

```console
➜ cat ./divisible-sum-pairs/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                 Results
           ┌──────────────────────────────────────────────────┐
        70 │                                                  │
           │                                                 .│
           │                                               .r`│
           │                                             ./`  │
           │                                           _/`    │
           │                                         ./       │
           │                                      ../         │
   T(n)    │                                    .r`           │
           │                                 .r/`             │
           │                              .r/`                │
           │                           .r/`                   │
           │                       ._r/`                      │
           │                  ._r-"`                          │
           │             ._-/"`                               │
         0 │_____-----"""`                                    │
           └──────────────────────────────────────────────────┘
           0                                              20000
                                    n
```

For the implementation details, see [benchmarking.rb](./benchmarking.rb).
