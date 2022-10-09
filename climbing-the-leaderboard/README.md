# Climbing the leaderboard

Challenge URL: https://www.hackerrank.com/challenges/climbing-the-leaderboard/problem

An arcade game player wants to climb to the top of the leaderboard and track their ranking. The game uses Dense Ranking, so its leaderboard works like this:

- The player with the highest score is ranked number 1 on the leaderboard.
- Players who have equal scores receive the same ranking number, and the next player(s) receive the immediately following ranking number.

**Constraints**

- $1 \leq n \leq 2.10^{5}$
- $1 \leq m \leq 2.10^{5}$
- $0 \leq ranked[i] \leq 2.10^{9}$ for $0 \leq i < n$
- $0 \leq player[j] \leq 2.10^{9}$ for $0 \leq j < m$
- The existing leaderboard, **ranked**, is in descending order
- The player's scores, **player**, are in ascending order

**Subtask**
For 60% of the maximum score:

- $< \leq n \leq 200$
- $< \leq m \leq 200$

## Test suite

The test suite for this challenge covers both arrays' constraints mentioned above, a happy path and a happy - `path with the flag to change from 0-based indexes to 1-based indexes in the response. The tests are:`

- `test_raises_exception_if_lookup_array_has_less_than_one_item_and_flag_is_disabled`
- `test_raises_exception_if_lookup_array_has_more_than_100_000_items_and_flag_is_disabled`
- `test_raises_exception_if_array_to_iterate_has_less_than_one_item_and_flag_is_disabled`
- `test_raises_exception_if_array_to_iterate_has_more_than_100_000_items_and_flag_is_disabled`
- `test_finds_the_correct_indexes`
- `test_uses_one_based_indexes_if_flag_is_specified`

The full test suite can be seen at [find_indexes.spec.rb](./find_indexes.spec.rb).

## Algorithm resolution description

The first step to solve this challenge is to create a unique set of items out of the `ranked` array, which in our code is called `lookup_arr`, so we can remove all the duplicate entries and gain some performance. Using `lookup_arr.uniq` here will not be enough, as I tried that and the submission was rejected because of time constraints (it was taking `160s` to execute). Thus, the built-in `Set` structure is the best construct to use to keep track of unique items.

Next, with the unique items in ~~memory~~ hand, we can start to iterate over our `player` array (which is called `array_to_iterate` in our code). For each item we need to:

```ruby
module HackerRank
  module Algorithms
    def self.find_indexes(lookup_arr:, array_to_iterate:, use_zero_based_indexes: true)
      increment = use_zero_based_indexes ? 0 : 1
      uniq_items = lookup_arr.uniq
      uniq_items_set = Set.new(lookup_arr)
      indexes = []

      for item in array_to_iterate
        if uniq_items_set.include?(item)
          index = uniq_items.index(item)
        elsif uniq_items.last > item
          index = uniq_items.size
        elsif
          index = uniq_items.bsearch_index { |existing_item| existing_item <= item }
        end

        indexes << index + increment
      end

      indexes
    end
  end
end
```

## Samples

The samples provided for this challenge are:

| ranked                                  | player                | expected result                         |
| --------------------------------------- | --------------------- | --------------------------------------- |
| [100, 90, 90, 80]                       | [70, 80, 105]         | [4, 3, 1]                               |
| [100, 90, 90, 80, 75, 60]               | [50, 65, 77, 90, 102] | [6, 5, 4, 2, 1]                         |
| [100, 100, 50, 40, 40, 20, 10]          | [5, 25, 50, 120]      | [6, 4, 2, 1]                            |
| [large_ranked_sample.txt](./ranked.txt) | [5, 25, 50, 120]      | [large_player_sample.txt](./player.txt) |

We can feed them into our runner:

```ruby
samples = [
  HackerRank::Samples.create_sample(
    expected_result: [4, 3, 1], params: [[100, 90, 90, 80], [70, 80, 105]]
  ),
  HackerRank::Samples.create_sample(
    expected_result: [6, 5, 4, 2, 1], params: [[100, 90, 90, 80, 75, 60], [50, 65, 77, 90, 102]]
  ),
  HackerRank::Samples.create_sample(
    expected_result: [6, 4, 2, 1], params: [[100, 100, 50, 40, 40, 20, 10], [5, 25, 50, 120]]
  ),
  HackerRank::Samples.create_sample(
    expected_result: large_expected_result, params: [large_ranked_sample, large_player_sample]
  ),
]

HackerRank::Runner.new(samples).run do |*params|
  ranked, player = params
  HackerRank::Challenges.climbing_leaderboard(ranked, player)
end
```

Which outputs:

```console
➜ ruby ./climbing-the-leaderboard/index.rb
Running sample #1
Success! ✅
  0.000043   0.000007   0.000050 (  0.000045)
Running sample #2
Success! ✅
  0.000013   0.000004   0.000017 (  0.000017)
Running sample #3
Success! ✅
  0.000017   0.000009   0.000026 (  0.000026)
Running sample #4
Success! ✅
  0.179910   0.005417   0.185327 (  0.188673)
```

A good indicative that the solution is looking good.

## Implementation benchmarking & algorithm complexity analysis

```console
➜ ruby ./climbing-the-leaderboard/benchmark.rb
n = 1  0.000057   0.000101   0.000158 (  0.000186)
n = 10001  0.048896   0.268494   0.317390 (  0.318016)
n = 20001  0.089525   0.530208   0.619733 (  0.620644)
n = 30001  0.139467   0.794842   0.934309 (  0.935736)
n = 40001  0.181378   1.061830   1.243208 (  1.244864)
n = 50001  0.251472   1.319712   1.571184 (  1.573207)
n = 60001  0.263491   1.570487   1.833978 (  1.835948)
n = 70001  0.310986   1.841825   2.152811 (  2.155184)
n = 80001  0.377282   2.103393   2.480675 (  2.483032)
n = 90001  0.459658   2.381257   2.840915 (  2.844483)
n = 100001  0.492027   2.636909   3.128936 (  3.132117)
n = 110001  0.500060   2.908013   3.408073 (  3.413538)
n = 120001  0.607283   3.369146   3.976429 (  4.054769)
n = 130001  0.676564   3.483298   4.159862 (  4.186666)
n = 140001  0.698697   3.754069   4.452766 (  4.468530)
n = 150001  0.779738   3.995018   4.774756 (  4.781943)
n = 160001  0.827238   4.219573   5.046811 (  5.053865)
n = 170001  0.797741   4.524055   5.321796 (  5.329535)
n = 180001  0.925261   4.750903   5.676164 (  5.683749)
n = 190001  0.885310   5.038031   5.923341 (  5.931404)
```

```console
➜ cat ./climbing-the-leaderboard/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                Results
          ┌──────────────────────────────────────────────────┐
        6 │                                            ..-`  │
          │                                         ../`     │
          │                                     ._-/`        │
          │                                  ../`            │
          │                             ._.-/`               │
          │                            ./                    │
          │                         ._/`                     │
   T(n)   │                      .r/`                        │
          │                   ../`                           │
          │                .r/`                              │
          │            ._-/`                                 │
          │         ._-`                                     │
          │      .,/`                                        │
          │   .r/`                                           │
        0 │_r/`                                              │
          └──────────────────────────────────────────────────┘
          0                                             200000
                                   n
```
