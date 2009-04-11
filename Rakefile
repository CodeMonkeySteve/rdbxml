require 'rake'
require 'rake/clean'
require 'rake/swigextensiontask'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/gempackagetask'
require 'rake/contrib/rubyforgepublisher'
require 'fileutils'

GEM_VERSION = '2.4.13.2'
ifacedir = File.join( File.dirname(__FILE__), 'ext' )
Rake::ExtensionTask.env[:swig_includedirs] << ifacedir

desc "Build the interface extension"
task :extensions => :dbxml

desc "Build the BDBXML interface extension"
Rake::SWIGExtensionTask.new :dbxml do |t|
  t.dir = 'ext'
  t.deps[:dbxml] += [ :'db-minimal', :dbxml_ruby ]
  t.link_libs += ['db', 'db_cxx', 'dbxml-2.4', 'xqilla', 'xerces-c']
end

task :test => :extensions
Rake::TestTask.new do |t|
  t.libs << 'ext'
  t.test_files = FileList['test/test_*.rb']
  t.verbose = true
  CLEAN.include 'test/test_*.db'
end

if File.exist? 'rdbxml.gemspec'
  spec = Gem::Specification.load 'rdbxml.gemspec'
  Rake::GemPackageTask.new spec  do |pkg|
    pkg.need_zip = pkg.need_tar = true
  end
end

# docs = Rake::RDocTask.new :rdoc do |rdoc|
#   rdoc.rdoc_dir = 'html'
#   rdoc.title    = "RDBXML -- XML Database for Ruby"
#   rdoc.options += ['--line-numbers', '--inline-source', '--main', 'README.rdoc', '--exclude', 'ext/*.c*']
#   rdoc.rdoc_files.include 'README.rdoc', 'MIT-LICENSE'
#   rdoc.rdoc_files.include 'lib/**/*.rb'
#   rdoc.rdoc_files.include 'docs/**/*.rb', 'docs/**/*.rdoc'
#   rdoc.rdoc_files.include 'rake/**/*task.rb'
# end
# if File.exist? 'publish.rake'
#   load 'publish.rake'
#   task :cruise => :publish
# end

task :default =>  [ :extensions, :test, :clean ]

