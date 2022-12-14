require 'benchmark'

module HackerRank
  def self.create_sample(expected_result:, params:)
    { params: params, expected_resp: expected_result }
  end

  module Samples
    def self.create_sample(expected_result:, params:)
      { params: params, expected_resp: expected_result }
    end
  end

  class Runner

    def initialize(samples, quiet: false)
      @samples = samples
      @quiet = quiet
    end

    def run(&block)
      Benchmark.benchmark do |x|
        @samples.each.with_index(0) do |sample, index|
          x.report("Running sample ##{index+1}\n") do
            expected_resp = sample[:expected_resp]

            r = block.call(*sample[:params])

            if r == expected_resp && !@quiet
              puts "Success! ✅"
            elsif r != expected_resp
              puts "Failed! ❌ | Expected #{expected_resp.inspect} but received #{r.inspect}\n"
            end
          end
        end
      end
    end

  end

end