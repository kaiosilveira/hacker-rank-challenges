# Simple array sum

Given an array of integers, find the sum of its elements.

**Constraints**

- $0 \leq n, arr[i] \leq 1000$

Note: This is probably the easiest challenge in the entire Hacker Rank platform, but nevertheless, it's a good opportunity to practice the attention to the details, testing and benchmarking analysis.

## Test suite

The test suite for this challenge contains two tests:

- one for when the array is empty, which expects zero as a result
- oen for then the array contains valid integer elements, which expects the correct sum≥

## Samples

The two samples provided by Hacker Rank are:

- expected result: 6, arr: [1, 2, 3]
- expected result: 31, arr: [1, 2, 3, 4, 10, 11]

For an extra sanity check, we can run these samples against our function using our `HackerRank::Runner` class:

```ruby
samples = [
  HackerRank.create_sample(expected_result: 6, params: [[1, 2, 3]]),
  HackerRank.create_sample(expected_result: 31, params: [[1, 2, 3, 4, 10, 11]]),
]

HackerRank::Runner.new(samples).run do |params|
  simple_array_sum(params)
end
```

Which prints the following results:

```console
Running sample #1
Success! ✅
Running sample #2
Success! ✅
```

So, everything looks fine!

## Algorithm resolution description

The solution for this challenge is as simple as calling the built-in method `.sum` on the input array:

```ruby
  def simple_array_sum(arr)
    arr.sum
  end
```

## Implementation benchmarking & time complexity analysis

As simple as this function may look, analyzing the time complexity here may be tricky, as we need to understand how the `sum` method behaves. [From Ruby's official API reference for Array#sum](https://apidock.com/ruby/Array/sum), we can see that the implementation uses a `for` loop to perform the aggregation of the results on a variable. Which will roughly mean

- $T = n.O(1)$

As it will perform a `+` operation for each item inside the array. Then, considering that `O(1)` is a constant coefficient here, we can rewrite this expression as

- $T \propto n$

therefore implying Linear complexity

- $T = O(n)$

Now, see the next section for a visual confirmation of this idea.

**Benchmarking**

The benchmarking results for this operation reinforces the linear relationship `O(n)` between `n` and `T(n)`, i.e., the size of the array and the time it takes to the operation to be performed.

To gather the results, the `simple_array_sum` function was ran 10 thousand times, with n increasing in a step of 1000 at a time, e.g., 0 items to 10000 items. Below are the timings of the execution:

```console
➜ ruby ./simple-array-sum/benchmarking.rb
n = 0  0.000009   0.000002   0.000011 (  0.000007)
n = 1000  0.002217   0.013193   0.015410 (  0.015519)
n = 2000  0.004363   0.027492   0.031855 (  0.032511)
n = 3000  0.006035   0.038229   0.044264 (  0.044444)
n = 4000  0.007930   0.050418   0.058348 (  0.058517)
n = 5000  0.010512   0.062987   0.073499 (  0.073692)
n = 6000  0.012138   0.075603   0.087741 (  0.087891)
n = 7000  0.013954   0.088390   0.102344 (  0.102573)
n = 8000  0.016698   0.101308   0.118006 (  0.118328)
n = 9000  0.018217   0.112388   0.130605 (  0.130898)
n = 10000  0.019829   0.125087   0.144916 (  0.145229)
```

And the chart for the results:

```console
➜ cat ./simple-array-sum/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                  Results
            ┌──────────────────────────────────────────────────┐
        0.2 │                                                  │
            │                                                  │
            │                                                  │
            │                                                  │
            │                                              _.-"│
            │                                        ._.-/"    │
            │                                    ._-/`         │
   T(n)     │                                _.-"`             │
            │                           ._-/"                  │
            │                       _r/"`                      │
            │                  ._-/"                           │
            │             ._r/"`                               │
            │        ..-/"`                                    │
            │    ..-"`                                         │
          0 │_.-"`                                             │
            └──────────────────────────────────────────────────┘
            0                                              10000
                                     n
```
