#!/usr/bin/env ruby
require 'ftools'

repo_dir      = File.expand_path(File.dirname(__FILE__))
home_dir      = ENV['HOME']
config_backup = File.join home_dir, '.dotfiles'

# Move into this dir
Dir.chdir repo_dir

ignore = ['install.rb', 'uninstall.rb', 'README.md', '.git', '.gitignore', '.gitignore.sample']
Dir.glob('*').reject{|file| ignore.include?(file) }.each do |config_file|
  dot_config_file           = ".#{config_file}"
  dot_config_file_full_path = File.join home_dir, dot_config_file
  config_file_full_path     = File.join repo_dir, config_file

  if File.exists?(dot_config_file_full_path)
    if File.symlink?(dot_config_file_full_path) and File.identical?(config_file_full_path, dot_config_file_full_path)
      puts "#{config_file} already installed at #{config_file_full_path}"
      next
    else
      Dir.mkdir config_backup unless File.exists?(config_backup)
      puts "Moving file from #{dot_config_file_full_path} to #{File.join(config_backup, config_file)}"
      File.move dot_config_file_full_path, File.join(config_backup, dot_config_file)
    end
  end

  puts "Linking file #{config_file_full_path} to #{dot_config_file_full_path}"
  File.symlink config_file_full_path, dot_config_file_full_path
end

