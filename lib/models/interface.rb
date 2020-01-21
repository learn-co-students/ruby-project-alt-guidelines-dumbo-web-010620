#THIS IS WHERE WE WILL HANDLE ALL LOGIC, 
class Interface
    attr_accessor :prompt, :user
  
    def initialize()
      @prompt = TTY::Prompt.new
    end
  
  
    def welcome
      puts "Welcome to Ye Trivia!"
  
      answer = self.prompt.select("Do you love Kanye more than Kanye loves Kanye?") do |menu| 
        menu.choice "I'll show you better that I can tell you.", -> {User.new_user}
        menu.choice "I think I came to the wrong place...", "Getcha ass out!!"
      end
      #welcome_handler(answer)
      end

      def question_one
        answer = self.prompt.select("She couldn't afford a car so she named her daughter:") do |menu|
            menu.choice "Mercedes"
            menu.choice "Alexus"
            menu.choice "Chevy"
            menu.choice "Toyota"
        end
    end

    #   def welcome_handler(choice) #based on answer above, I want it to do this..this method Creates
    #     case choice 
    #     when  1
    #         puts "Let's get to it!"
    #         User.new_user
    #     case choice
    #     when 2
    #         "Getcha ass out!!"
    #     end

    #   end

    #   def question_one
    #     answer = self.prompt.select("She couldn't afford a car so she named her daughter:")
    #   end
    #   end
  
    #   answer = self.prompt.select("Are you a returning user or are you a new user?", [
    #     {name: "New User", value: 1},
    #     {name: "Returning User", value: 2}
    #   ])
  
      # answer = self.prompt.select("Are you a returning user or are you a new user?",
      #   {"New User": 1, "Returning User": 2}
      # )
  
    #   answer = prompt.select("Are you a returning user or are you a new user?") do |menu|
    #     menu.choice "New User", -> {User.handle_new_user}
    #     menu.choice "Returning User", -> {User.handle_returning_user}
    #   end
  
    #   # welcome_handler(answer)
    # answer = prompt.select("Are you a returning user or are you a new user?") do |menu|
    #     menu.choice "New User", -> {User.handle_new_user}
    #     menu.choice "Returning User", -> {User.handle_returning_user}
    # end
  
    # def main_menu
    #   system "clear"
    #   user.reload
    #   prompt.select("Welcome #{self.user.name}! What would you like to do today?") do |menu|
    #     menu.choice "See All Teams", -> {self.user.list_teams}
    #     menu.choice "See All Heros"
    #     menu.choice "Create a Team"
    #     menu.choice "Edit a Team"
    #   end
    # end
  
    # def welcome_handler(choice)
    #   # binding.pry
    #   case choice
    #   when 1
    #     User.handle_new_user
    #   when 2
    #     User.handle_returning_user
    #   end
    # end
  
  end
  