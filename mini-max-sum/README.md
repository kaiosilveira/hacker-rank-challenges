# Mini Max Sum

🚧 WIP 🚧

Given five positive integers, find the minimum and maximum values that can be calculated by summing exactly four of the five integers. Then print the respective minimum and maximum values as a single line of two space-separated long integers.

**Constraints**

- $1 \leq arr[i] \leq 10^{8}$

# Test suite

- `test_raises_exception_if_array_has_more_than_5_items_and_flag_is_disabled`
- `test_executes_if_array_has_more_than_100_000_000_items_and_flag_is_enabled`
- `test_returns_the_sum_of_all_items_except_the_indicated_one`

## Algorithm resolution description

```ruby
clone = numbers.clone
clone.delete_at(clone.index(number_to_exclude))
clone.sum
```

## Samples

| numbers         | expected result |
| --------------- | --------------- |
| [1, 3, 5, 7, 9] | "16 24"         |
| [1, 2, 3, 4, 5] | "10 14"         |

```ruby
samples = [
  HackerRank::Samples.create_sample(expected_result: "16 24", params: [1, 3, 5, 7, 9]),
  HackerRank::Samples.create_sample(expected_result: "10 14", params: [1, 2, 3, 4, 5]),
]

HackerRank::Runner.new(samples).run do |*params|
  HackerRank::Challenges.mini_max_sum(params)
end
```

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

## Implementation benchmarking & algorithm complexity analysis

```console
➜ ruby ./mini-max-sum/benchmarking.rb
n = 1  0.000038   0.000075   0.000113 (  0.000139)
n = 2  0.000018   0.000056   0.000074 (  0.000075)
n = 3  0.000027   0.000089   0.000116 (  0.000120)
n = 4  0.000019   0.000078   0.000097 (  0.000097)
n = 5  0.000021   0.000091   0.000112 (  0.000113)
```

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
