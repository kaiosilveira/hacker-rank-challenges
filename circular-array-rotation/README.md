# Challenge name

Challenge URL: https://www.hackerrank.com/challenges/circular-array-rotation/problem

John Watson knows of an operation called a right circular rotation on an array of integers. One rotation operation moves the last array element to the first position and shifts all remaining elements right one. To test Sherlock's abilities, Watson provides Sherlock with an array of integers. Sherlock is to perform the rotation operation a number of times and then determine the value of the element at a given position.

For each array, perform a number of right circular rotations and return the values of the elements at the given indices.

**Example**

| input     | number of rotations | queries   | expected result |
| --------- | ------------------- | --------- | --------------- |
| [3, 4, 5] | 2                   | [1, 2]    | [5, 3]          |
| [1, 2, 3] | 2                   | [0, 1, 2] | [2, 3, 1]       |

**Constraints**

- $1 \leq n \leq 10^5 $
- $1 \leq a[i] \leq 10^5 $
- $1 \leq k \leq 10^5 $
- $1 \leq q \leq 500 $
- $1 \leq queries[i] < n $

Where:

- $n$ is the number of items in the input array
- $k$ is the number of rotations to be performed
- $a[i]$ is the value of each element in the array
- $q$ is the value of each element in the $queries$ array
- $queries[i]$ is the queries array

## Test suite 🧪

The test suite for this challenge covers the constraints described above and a happy path using the example's data. For the full test suite, see [challenge.spec.rb](./challenge.spec.rb) and [algorithm.spec.rb](./circularly_rotate_array.spec.rb).

## Algorithm resolution description 📄

To get started, we can divide the problem into two main parts:

- finding a way to rotate the array
- repeating the operation multiple times

**Finding a way to rotate the array**

This problem, in turn, can be divided into three parts:

- Removing the last element of the input array
- Shifting all the other elements in the array one position to the right
- Prepending the removed element to the beginning of the array

The first part can be accomplished by using the `Array#pop` method in Ruby, which removes the last element of an array and returns it.

After that, the second and third parts can be accomplished all at once by using the `Array#unshift` method, which does exactly what we need: shifting all elements one position to the right and prepending the given element to the first position.

Putting the two operations together, we have:

```ruby
array.unshift(array.pop)
```

**Repeating the operation multiple times**

Now, we need to repeat this operation many times, which is a trivial task. Thanks to Ruby's API completeness, being `rotations` the number of rotations we need to perform, we can simply:

```ruby
rotations.times { array.unshift(array.pop) }
```

I'm a big fan of immutable programming, though. So we can use a clone and return it instead, leaving the input array intact. The final method looks like this:

```ruby
def circularly_rotate_array(input:, rotations: 1)
  clone = input.clone
  rotations.times { clone = clone.unshift(clone.pop) }
  clone
end
```

The final code, including constraint validations, is available [here](./challenge.rb).

## Samples 🥯

With the code now running, we can run a quick sanity check with the example data provided above:

```ruby
samples = [
  HackerRank.create_sample(expected_result: [5, 3], params: [[3, 4, 5], 2, [1, 2]]),
  HackerRank.create_sample(expected_result: [2, 3, 1], params: [[1, 2, 3], 2, [0, 1, 2]])
]
```

Which, after feeding it into our runner:

```ruby
HackerRank::Runner.new(samples).run do |*params|
  array, number_of_rotations, queries = params
  HackerRank::Challenges.circular_array_rotation(
    input: array,
    number_of_rotations: number_of_rotations,
    queries: queries
  )
end

```

Gives the following output:
A good indication that the solution looks reasonable.

## Implementation benchmarking & time complexity analysis 📈

Let's now take a look at this implementation and see how it stands from a performance standpoint. Below, we have a code analysis and a benchmarking of the solution.

### Code analysis 🕵🏽‍♂️

To perform a time complexity analysis of our code, we can scan it from top to bottom, writing the big $O$ notation for each line (the code was slightly modified to allow for individual line comments):

```ruby
def circularly_rotate_array(input:, rotations: 1)
  clone = input.clone # O(1)
  rotations.times { # Integer#times: O(1)
      last_element = clone.pop # O(1)
      clone = clone.unshift(last_element) # Array#unshift: O(n)
    }
  clone # O(1)
end
```

With the big $O$ notations in place, we can then create an expression that will dictate the time complexity $T$ of the whole algorithm:

$T = O(1) + O(1) + (O(1) * O(n)) + O(1)$

As we have a term that depends on $n$, which is our varying term, we can safely ignore all other constants of the expression, which leaves us with:

$T = O(1) * O(n)$

And, finally:

$T = O(n)$

Therefore, we can say that the algorithm, as implemented, has a $O(n)$ (linear) time complexity.

**A note on Array#unshift**

As we can imagine, `Array#unshift` has an $O(n)$ time complexity curve because to prepend an element, it first needs to rearrange the array's internal structure to vacate the first position. This rearrangement will cause a move on every item in the array, therefore, as the number of elements ($n$) in the array increases, so does the time needed to perform the operation.

### Benchmarking 📊

To get a visual feeling of how the function behaves as $n$ increases, a benchmark was run from $1$ up to $10000$, resulting in the following chart:

```console
➜ cat ./circular-array-rotation/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                    Results
              ┌──────────────────────────────────────────────────┐
        0.003 │                                                  │
              │                                                 .│
              │                                             ._r@@│
              │                                         ._@@@@@TT│
              │                                 .    _@@@@@T"    │
              │                                 @@@@@@@TT`       │
              │                             ._r@@@@T"            │
   T(n)       │                         .\r@@@@T/                │
              │                      ._r@@@T/`                   │
              │                 .._@@@@T"`                       │
              │             .__@@@T/`                            │
              │          ._r@@T"`                                │
              │     ..r@@TT"                                     │
              │  __r@T/`                                         │
            0 │@@T"`                                             │
              └──────────────────────────────────────────────────┘
              0                                              10000
                                       n
```

Which, ignoring eventual CPU fluctuations, matches the given time complexity pattern theoretically demonstrated by the code analysis above.

For the full benchmarking code, see [benchmarking.rb](./benchmarking.rb).
