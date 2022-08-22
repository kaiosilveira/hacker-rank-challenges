require 'test/unit'

task :default => :test
task :test do
  Dir.glob('./*/**.spec.rb').each { |file| require file }
end