# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubycritic/rake_task'

RSpec::Core::RakeTask.new(:spec)

require 'rubocop/rake_task'

RuboCop::RakeTask.new do |task|
  task.requires << 'rubocop-rspec'
  task.requires << 'rubocop-rake'
end

RubyCritic::RakeTask.new do |task|
  task.options = '--format console --minimum-score 90'
end

task default: %i[spec rubocop rubycritic]
