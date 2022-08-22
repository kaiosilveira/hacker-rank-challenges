module BenchmarkUtils
  def self.write_benchmark_results_to_csv(filename:, x_label:, y_label:, data:)
    File.open(filename, 'w+') do |f|
      f.puts("#{x_label},#{y_label}")
      data.each do |x, y|
        f.puts("#{x},#{y}")
      end
    end
  end

  def self.benchmarking_n_times(fn = method(:method_name), n0: 0, n_max: 5, step: 1, &block)
    n_axis = []
    time_axis = []

    Benchmark.benchmark do |x|
      n0.step(n_max, step) do |n|
        time = x.report("n = #{n}") { fn.call(n) }
        n_axis << n
        time_axis << time.real
      end
    end

    yield [n_axis, time_axis]
  end

  def self.create_time_complexity_analysis(
    method_name:,
    n_max:,
    file_name:,
    n_incrementation_step: 1,
    space_between_chart_items: 1
  )
    BenchmarkUtils.benchmarking_n_times(
      method(method_name),
      n0: 0,
      n_max: n_max,
      step: n_incrementation_step
    ) do |n_values, time_results|
      results = ChartUtils.prepare_chart_data_with(
        x_axis: n_values,
        y_axis: time_results,
        max_x_size: time_results.size,
        step: space_between_chart_items
      )

      BenchmarkUtils.write_benchmark_results_to_csv(
        filename: file_name,
        x_label: 'n',
        y_label: 'T(n)',
        data: results
      )
    end
  end
end
