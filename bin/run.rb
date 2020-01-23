require_relative '../config/environment'
ActiveRecord::Base.logger.level = 1



cli = CommandLineInterface.new
choice = cli.welcome
# puts "hello world"
