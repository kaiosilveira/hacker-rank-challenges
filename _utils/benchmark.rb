module BenchmarkUtils
  def self.write_benchmark_results_to_csv(filename:, x_label:, y_label:, data:)
    File.open(filename, 'w+') do |f|
      f.puts("#{x_label},#{y_label}")
      data.each do |x, y|
        f.puts("#{x},#{y}")
      end
    end
  end

  def self.benchmarking_n_times(fn = method(:method_name), n0: 0, n_max: 5, &block)
    n_axis = []
    time_axis = []

    Benchmark.benchmark do |x|
      n0.upto(n_max) do |n|
        time = x.report("n = #{n}") { fn.call(n) }
        n_axis << n
        time_axis << time.real
      end
    end

    yield [n_axis, time_axis]
  end
end
