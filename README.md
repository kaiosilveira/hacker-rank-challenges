[![Continuous Integration](https://github.com/kaiosilveira/hacker-rank-challenges/actions/workflows/ruby.yml/badge.svg)](https://github.com/kaiosilveira/hacker-rank-challenges/actions/workflows/ruby.yml)

# hacker-rank-challenges

This repository is an aggregator of Hacker Rank challenge resolutions. Each subdirectory that doesn't start with an underscore is a different challenge from Hacker Rank. Inside each of them you'll find a similar structure, with:

- the actual code resolution for the challenge
- a test suite (`*.spec.rb`)
- a benchmark of the results (`benchmarking.rb`)
- a `README.md` file with the detailed explanation of the code implemented

## Solved challenges

See below a list with all solved challenges:

- [Left rotation](./left-rotation/)
- [Bill division](./bill-division/)
- [Divisible sum pairs](./divisible-sum-pairs/)
- [Simple array sum](./simple-array-sum/)
- [Sub array division](./sub-array-division/)
- [Birthday cake candles](./birthday-cake-candles/)
- [Electronics shop](./electronics-shop/)
- [Cat and mouse](./cat-and-mouse/)

## Programming language choice

Because of its simplicity, elegance and API completeness, Ruby was the chosen programming language to implement the code for the challenges.

## Testing & Continuous integration

**Unit testing**
The built-in `test/unit` test framework was used to implement the test suites, as no external dependency will be needed.

**Continuous integration**
A simple CI pipeline was put in place to execute the tests for each directory inside this repo. It basically sets up Ruby and runs the tests. This happens for every push to `main`. The config is:

```yml
name: Continuous Integration

on:
  push:
    branches: ["main"]

jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        ruby-version: ["2.6"]

    steps:
      - uses: actions/checkout@v3
      - name: Set up Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: ${{ matrix.ruby-version }}
          bundler: "Gemfile.lock"
          bundler-cache: true
      - name: Lock bundle
        run: bundle lock --add-platform x86_64-linux

      - name: Run tests
        run: bundle exec rake
```

See [ruby.yml](./.github/workflows/ruby.yml) for the actual file.

## Benchmarking

To benchmark the code execution, the [benchmark](https://github.com/ruby/benchmark) gem was used. A [benchmark-utils.rb](./_utils/benchmark.rb) module was created to abstract the setup for the benchmarking, allowing the client code to call it passing a reference to the function to be executed and some more configuration parameters. The `BenchmarkUtils` module also aggregates the value of `n` and the time it took to run the function for each execution and give it back to the client code, so it can store the results and perform the graphical analysis later. See below an example of the benchmark in action:

```console
➜ ruby ./left-rotation/benchmarking.rb
n = 0  0.000011   0.000003   0.000014 (0.000011)
n = 1  0.000003   0.000001   0.000004 (0.000003)
n = 2  0.000004   0.000001   0.000005 (0.000005)
n = 3  0.000003   0.000000   0.000003 (0.000004)
n = 4  0.000003   0.000000   0.000003 (0.000003)
n = 5  0.000003   0.000001   0.000004 (0.000003)
n = 6  0.000005   0.000001   0.000006 (0.000005)
n = 7  0.000003   0.000000   0.000003 (0.000004)
n = 8  0.000004   0.000002   0.000006 (0.000004)
n = 9  0.000003   0.000001   0.000004 (0.000003)
n = 10  0.000005   0.000001   0.000006 (0.000005)
```

## Time complexity

The time complexity is calculated for each challenge, using the [Big O](https://en.wikipedia.org/wiki/Big_O_notation) notation. Common time complexities are:

- Constant: $O(1)$
- Linear: $O(n)$
- Quadratic: $O(n^2)$

The experiment to calculate the time complexity for each challenge is basically an exercise of using all possible values described in the **Constraints** section of the challenge at Hacker Rank, always with an eye on the term that varies the most and could cause the biggest impact on the code execution. The analysis is performed on the dump generated by the benchmark process described above.

For each challenge, a chart was created to allow us to visually identify the time complexity for the solution. The [YouPlot](https://github.com/red-data-tools/YouPlot) gem was used to create the charts from the command line. See below an example of a chart generated off the results:

```console
➜ cat ./left-rotation/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                   Results
             ┌──────────────────────────────────────────────────┐
        0.02 │                                                  │
             │                                                  │
             │                                                  │
             │                                                  │
             │                                                , │
             │                                                /\│
             │                                               . |│
   T(n)      │                                         .r./""`  │
             │                                     __/"`        │
             │                            ._.--"`-/             │
             │                        _.--`                     │
             │                   r/"""                          │
             │             .r""/"                               │
             │     _.__--""`                                    │
           0 │__--" `                                           │
             └──────────────────────────────────────────────────┘
             0                                             100000
                                      n

```

In this case, we can clearly see a linear time complexity pattern `O(n)`.
