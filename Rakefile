require "test/unit"
require "fileutils"
require 'colorize'

task :default => :test
task :test do
  Dir.glob("./*/**.spec.rb").each { |file| require file }
end

task :create_challenge, [:arg1] do |t, args|
  challenge_name = args[:arg1]
  print "Copying files from template dir into "
  print challenge_name.green
  puts "..."

  Dir.glob('_templates/**/*').each do |file|
    dir, filename = File.dirname(file), File.basename(file)
    dest = File.join(challenge_name, dir.gsub('_templates', ''))
    full_file_name = File.join(dest, filename)
    print "Creating "
    puts "#{full_file_name}".blue
    FileUtils.mkdir_p(dest)
    FileUtils.copy_file(file, full_file_name)
  end

  puts "All set ✅"
  puts "Happy hacking! 🚀"
end
