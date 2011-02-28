# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name =    'rdbxml'
  s.version = '2.4.13.2'

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.platform = Gem::Platform::RUBY

  s.authors = [ 'Steve Sloan' ]
  s.email = 'steve@finagle.org'
  s.homepage = 'http://github.com/CodeMonkeySteve/rdbxml'
  s.summary = 'Ruby interface to the Berkeley DB XML database'
  s.description = 'Provides wrappers for the Oracle Berkeley DB XML C++ API, plus pure Ruby extensions'
#  s.date = '2009-04-10'

  s.files = %w|
    README.rdoc MIT-LICENSE docs/dbxml.rb
    ext/db-minimal.i ext/dbxml.i ext/dbxml_ruby.i
    lib/rdbxml.rb
  |
  s.test_files = %w| test/test_dbxml.rb test/test_rdbxml.rb |

  s.require_paths = %w| ext lib |
  s.extensions = 'Rakefile'

  s.has_rdoc = true
  s.rdoc_options = %w| --line-numbers --inline-source --main README.rdoc --exclude ext/*.c* |
  s.extra_rdoc_files = %w| README.rdoc |

#  s.rubygems_version = %q{1.3.0}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency 'rake', ['>= 0.7']
      s.add_runtime_dependency 'rake-tasks', [ '>= 0.2' ]
    else
      s.add_dependency 'rake', ['>= 0.7']
      s.add_dependency 'rake-tasks', [ '>= 0.2' ]
    end
  else
    s.add_dependency 'rake', ['>= 0.7']
    s.add_dependency 'rake-tasks', [ '>= 0.2' ]
  end
end
