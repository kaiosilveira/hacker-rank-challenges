[![Continuous Integration](https://github.com/kaiosilveira/hacker-rank-challenges/actions/workflows/ruby.yml/badge.svg)](https://github.com/kaiosilveira/hacker-rank-challenges/actions/workflows/ruby.yml)

# Hacker Rank Challenges

This repository is an aggregator of my Hacker Rank challenge resolutions. Inside each solution you will find:

- a main file for the challenge, which contains the samples and the challenge execution (`index.rb`)
- the actual code resolution for the challenge (`challenge.rb`)
- a test suite (`*.spec.rb`)
- a benchmark of the results (`benchmarking.rb`)
- a `README.md` file with a detailed explanation of the code implemented

My Hacker Rank profile is: [@silveira_kaio](https://www.hackerrank.com/silveira_kaio).

## Solved challenges ✅

See below a list with all solved challenges:

- [Bill division](./bill-division/)
- [Beautiful days at the Movies](./beautiful-days/)
- [Birthday cake candles](./birthday-cake-candles/)
- [Cat and mouse](./cat-and-mouse/) (ft [@Daniel-Silveira](https://github.com/Daniel-Silveira) and [@raulpesilva](https://github.com/raulpesilva))
- [Climbing the leader board](./climbing-the-leaderboard/)
- [Design PDF Viewer](./designer-pdf-viewer/)
- [Divisible sum pairs](./divisible-sum-pairs/)
- [Electronics shop](./divisible-sum-pairs/) (ft [@Daniel-Silveira](https://github.com/Daniel-Silveira) and [@raulpesilva](https://github.com/raulpesilva))
- [Left rotation](./left-rotation/)
- [Mini max sum](./mini-max-sum/)
- [Simple array sum](./simple-array-sum/)
- [Sub array division](./sub-array-division/)
- [Staircase](./sub-array-division/)
- [Utopian Tree](./utopian-tree/)
- [Viral Advertising](./viral-advertising/)

### Work in progress 🚧

The following challenges are work in progress, they're probably missing documentation, proper benchmarking or some constraint validation tests:

- [Between two sets](./between-two-sets/)
- [Repeated String](./repeated-string/)

## Programming language choice 👨🏽‍💻

Because of its simplicity, elegance and API completeness, Ruby was the chosen programming language to implement the code for the challenges.

## Testing & Continuous integration 🧪

Each challenge contains a unit test suite covering the constraints described by the challenge itself, at least one happy path, and sometimes some interesting particular cases.

The built-in `test/unit` test framework was used to implement the test suites, as no external dependency will be needed.

**Continuous integration**

A simple CI pipeline was put in place to execute the tests for each directory inside this repo. It sets up Ruby and runs the tests. This happens for every push to `main`. The config is:

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

## Benchmarking ⏰

To benchmark the code execution, the [benchmark](https://github.com/ruby/benchmark) gem was used. A [benchmarking.rb](./_utils/benchmark.rb) module was created to abstract the setup for the benchmarking, allowing the client code to call it passing a reference to the function to be executed and some more configuration parameters. The `Benchmarking` module also aggregates the value of `n` and the time it took to run the function for each execution and gives it back to the client code, so it can store the results and perform the graphical analysis later. See below an example of the benchmark in action:

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

## Time complexity 📈

The time complexity is calculated for each challenge, using the [Big O](https://en.wikipedia.org/wiki/Big_O_notation) notation. Common time complexities are:

- Constant: $O(1)$
- Linear: $O(n)$
- Quadratic: $O(n^2)$

The experiment to calculate the time complexity for each challenge is an exercise of using all possible values described in the **Constraints** section of the challenge at Hacker Rank, always with an eye on the term that varies the most and could cause the biggest impact on the code execution. The analysis is performed on the dump generated by the benchmark process described above.

For each challenge, a chart was created to allow us to visually identify the time complexity for the solution. The [YouPlot](https://github.com/red-data-tools/YouPlot) gem was used to create the charts from the command line. See below some examples of generated charts:

- Constant time complexity $O(1)$:

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

- Linear time complexity $O(n)$:

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

- Quadratic time complexity $O(n^{2})$:

```console
➜ cat ./electronic-shops/results.csv | uplot line -d, -w 50 -h 15 -t Results --canvas ascii --xlabel n --ylabel "T(n)"
                                Results
          ┌──────────────────────────────────────────────────┐
        5 │                                            ./    │
          │                                          .r`     │
          │                                         .`       │
          │                                       ./         │
          │                                     ./           │
          │                                   ./`            │
          │                                 ./`              │
   T(n)   │                              .r"                 │
          │                            ./`                   │
          │                          ./`                     │
          │                       _-"                        │
          │                    _-"                           │
          │                _r/"                              │
          │          ._r-/"                                  │
        0 │_____.--/"`                                       │
          └──────────────────────────────────────────────────┘
          0                                              10000
```
