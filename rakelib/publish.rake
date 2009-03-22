require 'rake/contrib/sshpublisher'

desc "Publish packages and docs to RubyForge"
task :publish => :rerdoc  do |t|
  Rake::SshDirPublisher.new('rubyforge.org', '/var/www/gforge-projects/rdbxml', 'html').upload
end
