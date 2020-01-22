#THIS IS WHERE WE WILL HANDLE ALL LOGIC, 
class Interface
    attr_accessor :prompt, :user
  
    
    def initialize()
      @prompt = TTY::Prompt.new
    end

    def run 
      welcome
      login_or_sign_up
      game_rounds(user)
    end

  
  #########################################   Main Menu   ################################################ 
    private

      def welcome
      puts "Welcome to Ye Trivia!"
      # answer = self.prompt.select("Do you love Kanye more than Kanye loves Kanye?") do |menu| 
      #   menu.choice "I'll show you better than I can tell you.", -> {User.create}
      #   menu.choice "I think I came to the wrong place...", "Getcha ass out!!"
      #   end
      end

      def login_or_sign_up
        puts "Sign-up or log in"
        answer = gets.chomp.downcase
        @user = User.find_or_create_by(name: answer)
        #binding.pry
        # sign_up = User.create(name: answer)
        # login = User.find_by(name: answer)
        #game_rounds(@user)
      end

      def game_rounds(user_instance)
        points = 0
        i = 0
        qal = Question.all
        while i < qal.length do
            written = prompt.ask(qal[i].inquiry)
            if qal[i][:answer] == written
                # binding.pry
                UserQuestion.create({user_id: user_instance.id, question_id: qal[i].id, correct?: true})
                points += 10
                #qal[i + 1].inquiry
            # elsif qal[i][:answer] != written
            #     UserQuestion.create({user_id: user_instance.id, question_id: qal[i].id, correct?: false})
            #     #qal[i + 1].inquiry
            #     points -= 5
            end
            i += 1            
        end
        puts "You have #{points}! But you don't love Kanye the way Kanye loves Kanye"
        # if points == 100 
        #   puts "You have #{points}! You got em all correct! But you will NEVER love Kanye more than Kanye loves Kanye "
        # elsif points > 90
        #   puts "You have #{points}! But you don't love Kanye the way Kanye loves Kanye"
        # else
        #   puts "Imma let you finish..but you are the worst Kanye fan of all time!!"
        

      end

# #########################################   Main Menu   ################################################ 
#       def first_trial
#         points = 0
#         first_q = Question.all.first 
#         answer_u = self.prompt.select(first_q.inquiry, ["Mercedes","Chevy", "Alexus"])
#         binding.pry
#         new_guy = User.new_user
#         newly_questions(answer_u)
#         if answer_u == "Alexus"
#           puts "you are correct."
#           #second_trial
#         else
#           puts "Goodbye..."
#         end
  
#       end

#     def second_trial

#     end

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
  