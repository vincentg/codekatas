require 'spec/rake/spectask'
require "rcov/rcovtask"
 
task :default => "test"
 
desc "Run all specs."
task :test => "test:spec"

desc "Run test coverage reports."
task :coverage => "test:coverage"

desc "Clean."
task :clean do
  system "rm -rf reports"
end

namespace :test do
  desc "Run all specs."
  Spec::Rake::SpecTask.new(:spec) do |spec|
    spec.spec_files = FileList["spec/**/*_spec.rb"]
  end
 
  desc "Generate test coverage and specs reports."
  Spec::Rake::SpecTask.new(:coverage) do |rcov|
    rcov.rcov = true
    rcov.rcov_dir = "reports/coverage"
    rcov.spec_opts = ["--format", "html:reports/specs/index.html", "--diff"]
    rcov.fail_on_error = false
    rcov.verbose = true
  end
end