require 'rake'

begin
  require 'metric_fu'
rescue LoadError
end

begin
  require 'spec/rake/spectask'

  Spec::Rake::SpecTask.new("spec") do |t|
    t.spec_files = FileList['spec/**/*_spec.rb']
    t.spec_opts = ['--color']
  end

  task :test do
    Rake::Task['spec'].invoke
  end

  Spec::Rake::SpecTask.new("rcov_spec") do |t|
    t.spec_files = FileList['spec/**/*_spec.rb']
    t.spec_opts = ['--color']
    t.rcov = true
    t.rcov_opts = ['--exclude', '^spec,/gems/']
  end
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name        = 'boo-box'
    gemspec.summary     = 'Ruby wrapper on the boo-box API'
    gemspec.email       = 'jeffry@jeffrydegrande.com'
    gemspec.homepage    = 'http;//github.com/jeffrydegrande/boo-box'
    gemspec.description = "Tiny ruby wrapper on the boo-box API"
    gemspec.authors     = ["Jeffry Degrande"]
  end
rescue LoadError
  puts "Jeweler nto available. Install it with: sudo gem install technicalpickles-jeweler"
end

task :default => [:test]
