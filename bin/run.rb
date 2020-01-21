require_relative '../config/environment'

cli = Interface.new
user_object = cli.welcome

if !user_object
    cli.welcome
    question_one
end



#binding.pry
# puts "hello world"
