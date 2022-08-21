require 'youplot'

module ChartUtils
  def self.prepare_chart_data_with(x_axis:, y_axis:, max_x_size:, step:)
    0.step(max_x_size, step).map { |n| [x_axis[n], y_axis[n]] }
  end
end
