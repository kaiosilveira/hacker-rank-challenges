# Designer PDF Viewer

Challenge URL: https://www.hackerrank.com/challenges/designer-pdf-viewer/problem

When a contiguous block of text is selected in a PDF viewer, the selection is highlighted with a blue rectangle. In this PDF viewer, each word is highlighted independently.

There is a list of $26$ character heights aligned by index to their letters. For example, 'a' is at index  and 'z' is at index $25$. There will also be a string. Using the letter heights given, determine the area of the rectangle highlight in $mm^2$ assuming all letters are $1mm$ wide.

**Example**

Below it's a table with the examples shared in the challenge description:

| Char heights                                                                   | Word   | Expected result |
| ------------------------------------------------------------------------------ | ------ | --------------- |
| [1, 3, 1, 3, 1, 4, 1, 3, 2, 5, 5, 5, 5, 1, 1, 5, 5, 1, 5, 2, 5, 5, 5, 5, 5, 5] | "torn" | 8               |
| [1, 3, 1, 3, 1, 4, 1, 3, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5] | "abc"  | 9               |
| [1, 3, 1, 3, 1, 4, 1, 3, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 7] | "zaba" | 28              |

**Constraints**

- $1 \leq h[?] \leq 7$, where $?$ is an English lowercase letter

## Test suite

The test suite for this challenge covers the constraints described above and a happy path using the example's data. The tests are:

- `test_raises_ex_if_char_heights_does_not_contain_26_items`
- `test_raises_ex_if_any_height_is_lower_than_1_and_constraint_enforcement_is_enabled`
- `test_raises_ex_if_any_height_is_lower_greater_than_7_and_constraint_enforcement_is_enabled`
- `test_applies_the_pattern_correctly`

For the full test suite, see [path_to_spec_file.spec.rb](./path_to_spec_file.rb).

## Algorithm resolution description

To solve this challenge, we need to find the index of each letter in the word in the array of heights. To accomplish that, we can first define an alphabet to query each character:

```ruby
alphabet = "abcdefghijklmnopqrstuvxwyz"
```

Then, we can transform the word in a string of chars:

```ruby
word.split("")
```

And map over each char to find its height:

```ruby
word_heights = word.split("").map { |char| char_heights[alphabet.index(char)] }
```

With that in hand, we just need to find the highest / tallest char in the word. That will be the height of the rectangle:

```ruby
tallest_char_height = word_heights.max
```

And then, to find the actual area, as the width of each char is fixed at $1mm$, we just need to multiply the amount of words by the tallest char height:

```ruby
tallest_char_height * word.size
```

The complete implementation looks like this:

```ruby
    def self.calculate_rect_area(char_heights:, word:)
      # constraint validation omitted for simplicity

      alphabet = "abcdefghijklmnopqrstuvxwyz"
      word_heights = word.split("").map { |char| char_heights[alphabet.index(char)] }
      tallest_char_height = word_heights.max

      tallest_char_height * word.size
    end
```

The final code, including constraint validations, is available [here](./path_to_file.rb).

## Samples

The samples used to run a quick sanity check on the implementation were the same provided by the challenge:

```ruby
samples = [
  HackerRank.create_sample(
    expected_result: 8,
    params: [
      [1, 3, 1, 3, 1, 4, 1, 3, 2, 5, 5, 5, 5, 1, 1, 5, 5, 1, 5, 2, 5, 5, 5, 5, 5, 5],
      "torn"
    ]
  ),
  HackerRank.create_sample(
    expected_result: 9,
    params: [
      [1, 3, 1, 3, 1, 4, 1, 3, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5],
      "abc"
    ]
  ),
  HackerRank.create_sample(
    expected_result: 28,
    params: [
      [1, 3, 1, 3, 1, 4, 1, 3, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 7],
      "zaba"
    ]
  )
]
```

Which, after feeding it into our runner:

```ruby
HackerRank::Runner.new(samples).run do |*args|
  char_heights, word = args
  HackerRank::Challenges.design_pdf_viewer(char_heights, word)
end
```

Gives the following output:

```
➜ ruby ./designer-pdf-viewer/index.rb
Running sample #1
Success! ✅
  0.000025   0.000007   0.000032 (  0.000029)
Running sample #2
Success! ✅
  0.000011   0.000004   0.000015 (  0.000016)
Running sample #3
Success! ✅
  0.000011   0.000002   0.000013 (  0.000013)
```

A good indicative that the solution looks reasonable.

## Implementation benchmarking & time complexity analysis

Let's now take a look at this implementation and see how it stands from a performance point of view. Below, we have a code analysis and a benchmarking of the solution.

### Code analysis

The code analysis for this challenge is straightforward:

```ruby
def self.calculate_rect_area(char_heights:, word:)
  alphabet = "abcdefghijklmnopqrstuvxwyz" # O(1)
  word_heights = word.split("").map { |char| char_heights[alphabet.index(char)] } # word.length x O(1)
  tallest_char_height = word_heights.max # O(1)

  tallest_char_height * word.size # O(1)
end
```

Which translates to the following expression (considering `word.length` as a constant $W$):

$O(1) + W.O(1) + O(1) + O(1)$

Which can be simplified as:

$3.W.O(1)$

Which, finally, can be considered as $O(1)$ as there are only constant terms. Therefore:

$T = O(1)$

Which means a constant time complexity.

### Benchmarking

To get a visual feeling of how the function behaves as $n$ increases, a benchmark was run randomizing the heights of each letter in the array of heights, according to the constraints. The chart below is the result:

```console
➜ cat ./designer-pdf-viewer/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                    Results
              ┌──────────────────────────────────────────────────┐
        0.002 │                                                  │
              │                                                  │
              │                                                  │
              │                                                  │
              │              |                                   │
              │       .      |       .      |                    │
              │       |      |       |      |             ,     ,│
   T(n)       │       |      |       |      |             |     |│
              │       |      |       |      |             |     |│
              │       |      |       |      |             |     |│
              │     | |,,, , |    .  L, .,. [    |       ||   . v│
              │@____@@@/@1_Lv@@]__@_L@^l@1@_@L___@_1___@_LL__L]_@│
              │|          `'              ""  `       '`'` '"   `│
              │|                                                 │
            0 │|                                                 │
              └──────────────────────────────────────────────────┘
              0                                            1000000
                                       n
```

Which, ignoring eventual CPU fluctuations, matches the given time complexity pattern theoretically demonstrated by the code analysis above.

For the full benchmarking code, see [benchmarking.rb](./benchmarking.rb).
