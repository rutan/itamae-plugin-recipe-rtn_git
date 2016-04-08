require 'rake'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

TARGETS = %w[centos7 ubuntu1404]

task itamae: 'itamae:all'
namespace :itamae do
  task all: TARGETS

  TARGETS.each do |target|
    desc "Run itamae provision to #{target}"
    task target do
      system("bundle exec itamae ssh -h #{target} --vagrant '#{File.expand_path("../spec/role.rb", __FILE__)}' -j '#{File.expand_path("../spec/node.json", __FILE__)}'")
    end
  end
end

task spec: 'spec:all'
namespace :spec do
  task all: TARGETS

  TARGETS.each do |target|
    desc "Run serverspec tests to #{target}"
    RSpec::Core::RakeTask.new(target.to_sym) do |t|
      ENV['TARGET_HOST'] = target
      t.pattern = 'spec/*_spec.rb'
    end
  end
end
