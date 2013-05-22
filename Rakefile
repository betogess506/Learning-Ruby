#Sample rake file, using it to get rid of a file I don't need anyway.
desc "Remove main.rb because I dont use it, test Rake"
task :delete_dat_main do
  files = Dir['main.rb']
  rm(files, verbose: true) unless files.empty?
end
