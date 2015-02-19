# encoding: utf-8

require 'rake'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

task spec: 'spec:all'
task default: :spec

namespace :spec do
  platforms = %w[sl6 ubuntu1404]
  task default: :all

  platforms.each do |platform|
    desc "Run serverspec tests in #{platform}"
    RSpec::Core::RakeTask.new('all') do |t|
      ENV['TARGET_HOST'] = platform
      t.pattern = "spec/*_spec.rb"
    end
  end
end
