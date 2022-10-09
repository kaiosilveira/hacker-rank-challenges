# Viral Advertising

Challenge URL: https://www.hackerrank.com/challenges/strange-advertising/problem

A given advertisement is shown to exactly 5 people on social media. Each day, $floor(recipients / 2)$ of the recipients like the advertisement and will share it with 3 friends on the following day.
Determine how many people have liked the ad by the end of a given day.

**Example**

$n = 5$

| Day | Shared | Liked | Cumulative |
| --- | ------ | ----- | ---------- |
| 1   | 5      | 2     | 2          |
| 2   | 6      | 3     | 5          |
| 3   | 9      | 4     | 9          |
| 4   | 12     | 6     | 15         |
| 5   | 18     | 9     | 24         |

**Constraints**

- $1 \leq n \leq 50$

## Test suite

The test suite for this challenge covers the constraints described above and makes sure that the pattern is being applied correctly up to day 5, as described in the example. The tests are:

- `test_raises_an_exception_if_nth_day_is_lower_than_1_and_constraint_enforcement_is_enabled`
- `test_does_not_raise_an_exception_nth_day_is_lower_than_1_and_constraint_enforcement_is_disabled`
- `test_raises_an_exception_if_nth_day_is_greater_than_50_and_constraint_enforcement_is_enabled`
- `test_does_not_raise_an_exception_nth_day_is_greater_than_50_and_constraint_enforcement_is_disabled`
- `test_replicates_the_pattern_correctly`

For the full test suite, see [calculate_cumulative_likes.spec.rb](./calculate_cumulative_likes.spec.rb).

## Algorithm resolution description

To solve this challenge, we need to accumulate the `like_count` up to the `nth` day, following the "reachability pattern" described in the example. The "reachability pattern" defines that for any given day, the number of likes is always the floored amount of the new people reached.

We know that `new_people_reached` starts with the number of people that received the ad in the first day (i.e. the initial cohort). So:

```ruby
INITIAL_COHORT = 5
new_people_reached = INITIAL_COHORT
```

Now, we can write the expression described above in the code, like this:

```ruby
new_likes = (new_people_reached / 2).floor
```

This gives us everything we need for day 1. To expand this expression to the `nth` day we first need to understand the behavior of new people reached. It's specified that the number of people who liked the ad will share it with three friends each. Which can be translated to the code as:

```ruby
new_people_reached = 3 * new_likes
```

Now, we can expand the expression to the `nth` day:

```ruby
like_count = 0
new_people_reached = INITIAL_COHORT
1.upto(n) do
  new_likes = (new_people_reached / 2).floor
  like_count += new_likes
  new_people_reached = 3 * new_likes
end
```

The final result, including the validation of the constraints, looks like this:

```ruby
INITIAL_COHORT = 5

def self.calculate_cumulative_likes_for_nth_day(n:)
  raise InputOutOfConstraintsException.new(
    input_name: "n",
    constraints: "1 <= n <= 50"
  ) if (n < 1 || n > 50) && ENV["CONSTRAINT_ENFORCEMENT_ENABLED"] == "enabled"

  like_count = 0
  new_people_reached = INITIAL_COHORT
  1.upto(n) do
    new_likes = (new_people_reached / 2).floor
    like_count += new_likes
    new_people_reached = 3 * new_likes
  end

  like_count
end
```

## Samples

The samples used to run a quick sanity check on the implementation were the same provided by the example. The values are:

| Day | Expected like count |
| --- | ------------------- |
| 1   | 2                   |
| 2   | 5                   |
| 3   | 9                   |
| 4   | 15                  |
| 5   | 24                  |

We can feed this into our runner:

```ruby
samples = [
  HackerRank.create_sample(expected_result: 2, params: 1),
  HackerRank.create_sample(expected_result: 5, params: 2),
  HackerRank.create_sample(expected_result: 9, params: 3),
  HackerRank.create_sample(expected_result: 15, params: 4),
  HackerRank.create_sample(expected_result: 24, params: 5),
]

HackerRank::Runner.new(samples).run do |n|
  HackerRank::Challenges.viral_advertising(n)
end
```

Which outputs:

```console
➜ ruby ./viral-advertising/index.rb
Running sample #1
Success! ✅
  0.000015   0.000012   0.000027 (  0.000031)
Running sample #2
Success! ✅
  0.000010   0.000006   0.000016 (  0.000015)
Running sample #3
Success! ✅
  0.000009   0.000006   0.000015 (  0.000013)
Running sample #4
Success! ✅
  0.000006   0.000004   0.000010 (  0.000010)
Running sample #5
Success! ✅
  0.000006   0.000004   0.000010 (  0.000009)
```

A good indicative that the solution looks reasonable.

## Implementation benchmarking & time complexity analysis

Let's now take a look at this implementation and see how it stands from a performance point of view. Below, we have a code analysis and a benchmarking of the solution.

**Code analysis**

We can do a quick code analysis on the solution by adding a comment with the time complexity for each line:

```ruby
like_count = 0 # O(1)
new_people_reached = INITIAL_COHORT # O(1)

1.upto(n) do #n x block
  new_likes = (new_people_reached / 2).floor # O(1)
  like_count += new_likes # O(1)
  new_people_reached = 3 * new_likes # O(1)
end

like_count # O(1)
```

Putting everything together, we have the following expression:

n x block $\to n.(O(1) + O(1) + O(1)) + O(1)$

As we have a term being multiplied by $n$, which is one order of magnitude higher than "constant", we can ignore the last part, which leaves us with:

$n.(3.O(1))$

As we're only interested in the order of magnitude and, again, $n$ dominates any constant, we can say that the time complexity $T$ for this implementation is in the order of $n$:

$T = O(n)$

Which means a linear time complexity.

**Benchmarking**

To visually confirm the time complexity described above, a benchmarking was ran from $n = 1$ up to $n = 10000$, which resulted in the output below:

```console
➜ cat ./viral-advertising/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                   Results
             ┌──────────────────────────────────────────────────┐
        0.02 │                                                  │
             │                                                  │
             │                                            .,.. _│
             │                                            ||@@@@│
             │                                   .,   ...]@@TT|`│
             │                                 . ||. ,@@/@^"  ` │
             │                                 |.|L@@@T`        │
   T(n)      │                               ._@@@T@'           │
             │                            .\@@T``  |            │
             │                      . .,,@@//`                  │
             │        .            .1_rT"`                      │
             │        l      ..__r-T/`                          │
             │       .].   v@@@T/`                              │
             │     .@@@@@T|`                                    │
           0 │__r@@T^""`                                        │
             └──────────────────────────────────────────────────┘
             0                                              10000
                                      n

```
