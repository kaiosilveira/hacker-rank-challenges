# Cat and mouse

Two cats and a mouse are at various positions on a line. You will be given their starting positions. Your task is to determine which cat will reach the mouse first, assuming the mouse does not move and the cats travel at equal speed. If the cats arrive at the same time, the mouse will be allowed to move and it will escape while they fight.

You are given `q` queries in the form of `x`, `y`, and `z` representing the respective positions for cats `A` and `B`, and for mouse `C`. Complete the function `catAndMouse` to return the appropriate answer to each query, which will be printed on a new line.

- If cat `A` catches the mouse first, print Cat A.
- If cat `B` catches the mouse first, print Cat B.
- If both cats reach the mouse at the same time, print Mouse C as the two cats fight and mouse escapes.

**Constraints**

- $1 \leq q \leq 100$
- $1 \leq x, y, z \leq 100$

## Test suite

The test suite for this challenge covers the cases where either Cat A or Cat B gets to the mouse first, and also the case when both cats gets to the mouse at the same time and the mouse escapes. The tests are:

- `test_item_A_is_the_closest`
- `test_item_B_is_the_closest`
- `test_defaults_to_target`

The full test suite can be seen at [get_closest_or_default.rb](./get_closest_or_default.spec.rb).

## Challenge resolution description

To solve this challenge we need to calculate the absolute distance each cat is from the mouse:

```ruby
item_a_distance = (target[:position] - itemA[:position]).abs
item_b_distance = (target[:position] - itemB[:position]).abs
```

And the return the appropriate values for each case:

```ruby
return itemA[:label] if item_a_distance < item_b_distance
return itemB[:label] if item_b_distance < item_a_distance
```

If both cats gets to the mouse at the same time, then the mouse escapes:

```ruby
  # ...
  target[:label]
end
```

The complete implementation is:

```ruby
def self.get_closest_or_default(itemA:, itemB:, target:)
  item_a_distance = (target[:position] - itemA[:position]).abs
  item_b_distance = (target[:position] - itemB[:position]).abs

  return itemA[:label] if item_a_distance < item_b_distance
  return itemB[:label] if item_b_distance < item_a_distance

  target[:label]
end
```

## Samples

The provided samples for this challenge are:

| x (Cat A) | y (Cat B) | z (Mouse C) | expected result |
| --------- | --------- | ----------- | --------------- |
| 2         | 5         | 4           | Cat B           |
| 1         | 2         | 3           | Cat B           |
| 1         | 3         | 2           | Mouse C         |

We can feed them into our runner:

```ruby
samples = [
  HackerRank.create_sample(expected_result: 'Cat B', params: [2, 5, 4]),
  HackerRank.create_sample(expected_result: 'Cat B', params: [1, 2, 3]),
  HackerRank.create_sample(expected_result: 'Mouse C', params: [1, 3, 2]),
]

HackerRank::Runner.new(samples).run do |*params|
  catA, catB, mouse = params
  HackerRank::Challenges.cat_and_mouse(catA, catB, mouse)
end
```

which outputs:

```console
➜ ruby cat-and-mouse/index.rb
Running sample #1
Success! ✅
  0.000016   0.000006   0.000022 (  0.000017)
Running sample #2
Success! ✅
  0.000006   0.000004   0.000010 (  0.000009)
Running sample #3
Success! ✅
  0.000004   0.000004   0.000008 (  0.000008)
```

A good indicative that the solution works.

## Implementation benchmarking & time complexity analysis

Performing a time complexity analysis for this code is straightforward, as there are no loops involved. Below is the implementation with the corresponding big O notation as comments for each line:

```ruby
def self.get_closest_or_default(itemA:, itemB:, target:)
  item_a_distance = (target[:position] - itemA[:position]).abs # O(1)
  item_b_distance = (target[:position] - itemB[:position]).abs # O(1)

  return itemA[:label] if item_a_distance < item_b_distance # O(1)
  return itemB[:label] if item_b_distance < item_a_distance # O(1)

  target[:label] # O(1)
end
```

Therefore:

- $T \propto O(1) + O(1) + O(1) + O(1) + O(1)$

Which can be simplified as:

- $T \propto O(1) + O(1) + O(1) + O(1) + O(1) \to T \propto 5.O(1)$

And finally, getting rid of the constants:

- $T \propto O(1)$

Which implies that the time complexity for this solution is in the order of complexity `O(1)`.

**Benchmarking**

To visualize what is explained above, we ran the function 1 million times, with ever increasing values for the positions. See below a chunk of the execution timings:

```console
n = 999850  0.000005   0.000017   0.000022 (  0.000021)
n = 999860  0.000004   0.000017   0.000021 (  0.000021)
n = 999870  0.000004   0.000017   0.000021 (  0.000021)
n = 999880  0.000005   0.000018   0.000023 (  0.000022)
n = 999890  0.000004   0.000017   0.000021 (  0.000021)
n = 999900  0.000004   0.000017   0.000021 (  0.000021)
n = 999910  0.000004   0.000017   0.000021 (  0.000021)
n = 999920  0.000004   0.000017   0.000021 (  0.000021)
n = 999930  0.000005   0.000017   0.000022 (  0.000022)
n = 999940  0.000004   0.000017   0.000021 (  0.000021)
n = 999950  0.000004   0.000017   0.000021 (  0.000022)
n = 999960  0.000004   0.000017   0.000021 (  0.000022)
n = 999970  0.000005   0.000017   0.000022 (  0.000021)
n = 999980  0.000005   0.000017   0.000022 (  0.000022)
n = 999990  0.000005   0.000017   0.000022 (  0.000021)
n = 1000000  0.000005   0.000017   0.000022 (  0.000022)
```

And the corresponding chart for the execution:

```console
➜ cat ./cat-and-mouse/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                   Results
             ┌──────────────────────────────────────────────────┐
        0.02 │                                                  │
             │                                                  │
             │                                                  │
             │                                                  │
             │                                                  │
             │                                                  │
             │                                                  │
   T(n)      │                                   |              │
             │                          .        |              │
             │                          |        |              │
             │                          |    .   |              │
             │                          |    |   |              │
             │ .        ,.              |    |   |              │
             │ | .    , ||              |    |   |              │
           0 │@@_11___]_L1__1___________]____]___L_________]____│
             └──────────────────────────────────────────────────┘
             0                                            1000000
                                      n
```

Which, ignoring the CPU fluctuations, implies a constant time of execution.

For the full benchmarking code, see [benchmark.rb](./benchmark.rb).
