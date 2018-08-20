require "bundler/gem_tasks"
require "rspec/core/rake_task"

task :default => :test

task :test do
  sh "bundle exec rspec --format progress"
  sh "bundle exec cucumber --format progress"
end
