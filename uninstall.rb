#!/usr/bin/env ruby
require 'ftools'

# This script sucks

home_dir      = ENV['HOME']
config_backup = File.join home_dir, '.dotfiles'

Dir.chdir home_dir
Dir.glob(File.join(config_backup, '.*')).each do |dot_config_file|
  config_file               = File.basename dot_config_file
  dot_config_file_full_path = File.join home_dir, config_file
  backup_file_full_path     = dot_config_file

  next if config_file =~ /^\.+$/
  next if config_file =~ /dotfiles/

  if File.exists?(dot_config_file_full_path)
    puts "Removing current config file: #{dot_config_file_full_path}"
    File.safe_unlink(dot_config_file_full_path)
  end

  if File.symlink?(backup_file_full_path)
    backup_file_full_path = File.readlink backup_file_full_path
  end
  puts "Moving backup file: #{backup_file_full_path} => #{dot_config_file_full_path}"
  File.mv backup_file_full_path, dot_config_file_full_path
end

FileUtils.rmdir config_backup
