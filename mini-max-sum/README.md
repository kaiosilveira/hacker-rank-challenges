# Mini Max Sum

Given five positive integers, find the minimum and maximum values that can be calculated by summing exactly four of the five integers. Then print the respective minimum and maximum values as a single line of two space-separated long integers.

**Constraints**

- $1 \leq arr[i] \leq 10^{8}$

# Test suite

The test suite for this challenge covers the constraints described above and a happy path scenario:

- `test_raises_exception_if_array_has_more_than_5_items_and_flag_is_disabled`
- `test_executes_if_array_has_more_than_100_000_000_items_and_flag_is_enabled`
- `test_returns_the_sum_of_all_items_except_the_indicated_one`

For implementation details, please see [perform_all_but_one_sum.spec.rb](./perform_all_but_one_sum.spec.rb).

## Algorithm resolution description

To solve this challenge, a method was introduced to perform a all-but-one sum, this method receives the array to be summed and the item that it should exclude from the sum:

```ruby
module HackerRank
  module Algorithms
    def self.perform_all_but_one_sum(numbers:, number_to_exclude:)
      # implementation details...
    end
  end
end
```

With this in hand, in the challenge code, we can call this method two times: the first call excludes `arr.max` and the second call excludes `arr.min`, then we will have the `min` and `max` values, as we wanted:

```ruby
module HackerRank
  module Challenges
    def self.mini_max_sum(arr)
      min = Algorithms.perform_all_but_one_sum(numbers: arr, number_to_exclude: arr.max)
      max = Algorithms.perform_all_but_one_sum(numbers: arr, number_to_exclude: arr.min)
      result = "#{min} #{max}"
      puts result
      result
    end
  end
end
```

The implementation of `perform_all_but_one_sum` is also pretty straightforward. It clones the `numbers` array to perform a `delete_at` call and remove the `number_to_exclude`. Then it proceeds with the sum:

```ruby
clone = numbers.clone
clone.delete_at(clone.index(number_to_exclude))
clone.sum
```

And that's it!

## Samples

Two samples were provided for this challenge:

| numbers         | expected result |
| --------------- | --------------- |
| [1, 3, 5, 7, 9] | "16 24"         |
| [1, 2, 3, 4, 5] | "10 14"         |

We can feed them into our runner:

```ruby
samples = [
  HackerRank::Samples.create_sample(expected_result: "16 24", params: [1, 3, 5, 7, 9]),
  HackerRank::Samples.create_sample(expected_result: "10 14", params: [1, 2, 3, 4, 5]),
]

HackerRank::Runner.new(samples).run do |*params|
  HackerRank::Challenges.mini_max_sum(params)
end
```

which outputs:

```console
➜ ruby ./mini-max-sum/index.rb
Running sample #1
16 24
Success! ✅
  0.000026   0.000010   0.000036 (  0.000031)
Running sample #2
10 14
Success! ✅
  0.000011   0.000007   0.000018 (  0.000017)
```

A good sign that everything looks ok.

## Implementation benchmarking & algorithm complexity analysis

**Code analysis**

Time complexity analysis for this implementation is straightforward: the only expression that is deeply impacted by the size of the `numbers` array here is the call to `sum`, which will reduce the elements in the array. See below the time complexity comments line by line:

```ruby
clone = numbers.clone # O(1)
clone.delete_at(clone.index(number_to_exclude)) # O(1)
clone.sum # O(n)
```

The `T` expression looks like:

- $T \propto O(1) + O(1) + O(n)$

Which is equivalent to:

- $T \propto 2.O(1) + O(n)$

And, removing the constant terms, we have:

- $T \propto O(n)$

Which means that this algorithm has Linear Time Complexity.

**Benchmarking**

To benchmark this code, we went 10 times above the limit of 5 items described by the challenge. Here's a chunk of the output to give an overall idea of timings:

```console
➜ ruby ./mini-max-sum/benchmarking.rb
n = 1  0.000038   0.000075   0.000113 (  0.000139)
n = 2  0.000018   0.000056   0.000074 (  0.000075)
n = 3  0.000027   0.000089   0.000116 (  0.000120)
n = 4  0.000019   0.000078   0.000097 (  0.000097)
n = 5  0.000021   0.000091   0.000112 (  0.000113)
```

And the resulting chart confirms the linear time complexity described in the code analysis section above:

```console
➜ cat ./mini-max-sum/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                    Results
              ┌──────────────────────────────────────────────────┐
        0.001 │                                                 .│
              │                                                . │
              │                                                | │
              │                                          .,  ..` │
              │                                       .,./\.-/   │
              │                                  .. ./"`"`       │
              │                           ,.   .-`"/"`           │
   T(n)       │                         . ||.."/                 │
              │                     ._./'/`  `                   │
              │                    ./                            │
              │                _./"`                             │
              │            _r-"                                  │
              │ .    __.-/"                                      │
              │.\r\-"                                            │
            0 │/                                                 │
              └──────────────────────────────────────────────────┘
              0                                                 50
                                       n
```

For the full benchmarking implementation details, please see [benchmarking.rb](./benchmarking.rb).
