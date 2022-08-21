# Bill division

Two friends Anna and Brian, are deciding how to split the bill at a dinner. Each will only pay for the items they consume. Brian gets the check and calculates Anna's portion. You must determine if his calculation is correct.
For example, assume the bill has the following prices: `bill = [2, 4, 6]`. Anna declines to eat item `k = bill[2]` which costs `6`. If Brian calculates the bill correctly, Anna will pay `(2 + 4) / 2 = 3`. If he includes the cost of `bill[2]`, he will calculate `(2 + 4 + 6) / 2 = 6`. In the second case, he should refund `3` to Anna.

**Function Description**

Complete the `bonAppetit` function in the editor below. It should print "Bon Appetit" if the bill is fairly split. Otherwise, it should print the integer amount of money that Brian owes Anna.
bonAppetit has the following parameter(s):

- `bill`: an array of integers representing the cost of each item ordered
- `k`: an integer representing the zero-based index of the item Anna doesn't eat
- `b`: the amount of money that Anna contributed to the bill

**Constraints**

- $2 \leq n \leq 10^5$
- $0 \leq k < n$
- $0 \leq bill[i] \leq 10^4$
- $0 \leq b \leq \displaystyle\sum_{i=0}^{n-1} bill[i]$
- The amount of money due Anna will always be an integer

## Test suite

Two tests were added to cover this implementation: The first one validates that the function returns "Bon Appetit" for the case when the bill is correctly split and the other one validates that the amount owed to Anna by Brian is returned in cases where the bill is incorrectly split.

For the implementation details, see [validate-bill-division.spec.rb](./validate-bill-division.spec.rb).

## Algorithm resolution description

The strategy to implement the solution for this challenge was to first separate the price of the item that Anna refused to eat, because this amount will be added to Brian's total later on. To accomplish that, we can use the `.delete_at` method. This method will remove the item from the `bill_items` array and return it, so we can conveniently store it into a variable to use it later.

```ruby
  partial_brian = bill_items.delete_at(index_of_item_anna_refused_to_eat)
```

Then, we move on to calculate the total price of the items they've shared:

```ruby
  total_price_of_shared_items = bill_items.reduce(&:+)
```

And then we calculate the how much each person owes:

```ruby
  total_shared_price_for_each_person = total_price_of_shared_items / 2
```

Finally, we can calculate Brian's part by adding his part of the total to the price of the item that he ate by himself:

```ruby
  total_brian = total_shared_price_for_each_person + partial_brian
```

And then we just need to return the correct value according to whether Brian has split the bill correctly or not:

```ruby
  if bill_division_according_to_brian == total_shared_price_for_each_person
    return "Bon Appetit"
  else
    return (bill_division_according_to_brian - total_shared_price_for_each_person).abs
  end
```

Note the `.abs` at the end to make sure that both the order of the items and negative numbers will not affect the result.

The full code is [here](./bill-division.rb).

You may have noticed that this function's signature is not exactly the same as the one that Hacker Rank creates. This is just because I wanted to give more readable names for the parameters. The actual response for the challenge is [here](./index.rb) and is just a wrapper that maps the input parameters and calls `validate_bill_division`.

## Implementation benchmarking & algorithm complexity analysis

Calculating the time complexity for this implementation is pretty straightforward, as we only have a bunch of variable assignments and simple math. Starting by the function parameters, the only structure with potential for growth is the `bill_items` array. This parameter is critical because we are reducing its values to get the total price of shared items. The `bill_items.reduce(&:+)` has `O(n)` complexity, as the `+` operation will happen `n` times, where `n` is the size of `bill_items`. See below a closer look into the big O notations for each statement:

```ruby
  def validate_bill_division(
    bill_items:,
    index_of_item_anna_refused_to_eat:,
    bill_division_according_to_brian:
  )
    partial_brian = bill_items.delete_at(index_of_item_anna_refused_to_eat) # O(1)
    total_price_of_shared_items = bill_items.reduce(&:+) # (n x O(1))
    total_shared_price_for_each_person = total_price_of_shared_items / 2 # O(1)
    total_brian = total_shared_price_for_each_person + partial_brian # O(1)

    if bill_division_according_to_brian == total_shared_price_for_each_person # O(1)
      return "Bon Appetit" # O(1)
    else
      return (bill_division_according_to_brian - total_shared_price_for_each_person).abs # O(1)
    end
  end
```

Then, the resulting expression for `T` is:

$T = O(1) + n x O(1) + O(1) + O(1) + O(1) + O(1) + O(1)$

which we can express as:

$T = c_{1} + n.O(1) + c_{2} + c_{3} + c_{4} + c_{5} + c_{6}$

Getting rid of the constants, we're left with:

$T = n.O(1)$

Then, considering that `O(1)` is the coefficient here, as `n` may vary as well, we have deduced that `T` is in the order of `n`, and thus the function has a `O(n)` complexity.

**Benchmarking**

To benchmark this function execution, the following arbitrary values were chosen for `index_of_item_anna_refused_to_eat` and `bill_division_according_to_brian`, as these values do not add to the function's complexity:

- `index_of_item_anna_refused_to_eat = n / 2`
- `bill_division_according_to_brian = 3`

Then, a function to create an array of random integers was introduced to create the `bill_items` array, ranging from 1 up to 10.000 items. Each entry in this array also varies from zero to 10.000:

```ruby
def create_array_of_random_integers(n)
  (0..n).to_a.map { SecureRandom.random_number(10000) }
end
```

The following results were obtained after executing the function 10000 times, with an ever increasing size of `bill_items`:

```console
➜ cat ./bill-division/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                     Results
               ┌──────────────────────────────────────────────────┐
        0.0008 │                                                  │
               │                                              ._-"│
               │                                          ._-/`   │
               │                                       _r/`       │
               │                                   ../"           │
               │                                ../`              │
               │                             _r/`                 │
   T(n)        │                         ._-"                     │
               │                      .r/`                        │
               │                  ..-"`                           │
               │               _r/`                               │
               │           ..-"                                   │
               │       ._-/`                                      │
               │   ..-"`                                          │
             0 │.-"`                                              │
               └──────────────────────────────────────────────────┘
               0                                              10000
                                        n
```

The chart strongly suggests a linear time complexity `O(n)` for the function, as the code analysis had suggested previously.
