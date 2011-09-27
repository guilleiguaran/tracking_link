require "bundler/gem_tasks"

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.test_files = Dir.glob("#{File.dirname(__FILE__)}/test/**/*_test.rb").sort
  t.verbose = true
  t.warning = true
end
