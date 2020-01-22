require "tty-prompt"
require "pry"

class CLI
    
    attr_reader :user_name

    def run
        clear
        welcome
        enter_name
        find_user
        clear
        menu
        
    
    end

    def welcome
        puts "Welcome to NationRide!".center(100)
    end

    def enter_name
        puts "Please enter your name."
        @user_name = gets.chomp.downcase
    end


    def user_valid?
        if User.all.find_by(name: @user_name)
            true
        else
            false
        end
    end

    def find_user
        if user_valid?
            @user_inst = User.all.find_by(name: @user_name) 
        else
            @user_inst = User.create(name: @user_name)
        end
    end

    

    def appointment_valid?
        if Appointment.find(@user_inst.id)
            true
        else
            false
        end
    end

    def find_appointment
        if appointment_valid?
            desired_appointment = Appointment.find(@user_inst.id)
            puts "\n The appointment for #{desired_appointment.user.name.capitalize} is at #{desired_appointment.time} on #{desired_appointment.date}"
        else
            puts "\n You have no appointments. Would you like to make one? (Y/N)"
                answer = gets.chomp
                if answer.undercase = "y"
                puts "Please enter date in MM/DD/YYYY format"
                date = gets.chomp
                "Please enter time for your appointment (12-hour format)"
                time = gets.chomp
                "Pick bike color"
                list of bikes/color
                Appointment.create(date: date, time: time, user_id: @user_inst.id, bike_id: 1 )
                end
        end
    end

    def menu
        prompt = TTY::Prompt.new

        welcome
        puts "Hello #{@user_name.capitalize}!"
        prompt.select("What would you like to do today?") do |menu|
            menu.choice "make an appointment", -> {bike_selection}
            menu.choice "check an appointment", -> {find_appointment}
            menu.choice "update an appointment"
            menu.choice "delete an appointment"
        end

    end

    def bike_selection
        prompt = TTY::Prompt.new

        prompt.select("Select color of bike") do |menu|
            menu.choice "Bronx", -> {@location = "Bronx", color_selection}
            menu.choice "Queens", -> {}
            menu.choice "Brooklyn", -> {}
            menu.choice "Manhattan", -> {}
            menu.choice "Staten Island", -> {}
        end
    end

    def build_bike
        @location

    end

   
    def clear
        system ("clear")
    end


end
