#Sample rake file, using it to get rid of a file I don't need anyway.
desc "cleanup main.rb - as I use it only as a file for testing snippits"
task :clean_main do
  f = File.open('main.rb', 'w')
  f.print "\#This is a file that is used as a 'test file\n"
  f.print "\#Most of what happens here can be done in IRB\n"
  f.print "\#It's used for small test cases and snippets\n"
  f.print "\#This file is cleaned on 'rake clean_main'\n"
  f.close
end

desc "Remove backup files created by windows"
task :rm_backups do
  files = Dir['*.bak']
  rm(files, verbose: true) unless files.empty?
end

desc "run all cleanup routines"
task :clean => [:rm_backups, :clean_main] do
  puts "Backups deleted, main cleaned"
end

desc "Default task"
task :default do 
  puts "run with rm_backups, clean_main, or clean"
end
