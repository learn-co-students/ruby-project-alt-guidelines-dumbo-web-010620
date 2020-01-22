class Cli
    def welcome
        puts "Welcome to NationRide"
        get_name    
        

    end

    def get_name
        puts "please enter name"
        name = gets.chomp
    end

    

end