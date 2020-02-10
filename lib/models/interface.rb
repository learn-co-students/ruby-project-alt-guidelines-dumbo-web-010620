#THIS IS WHERE WE WILL HANDLE ALL LOGIC, 
require 'pry'
class Interface 
    attr_accessor :prompt, :user
    attr_reader :purchase, :product
  
    
    def initialize()
      @prompt = TTY::Prompt.new
    end

    def run 
      system "clear"
      welcome
      login_or_sign_up
      main_menu
    end


  ########################################### welcome #################################################### 
    def welcome
      display_ye_world
      puts "Welcome to Ye World! Don't be alarmed if I speak in the third-person. That's the holy trinity!"
      sleep(0.5)
    end
  
  ########################################  Main Menu   ############################################################ 
    private

      

      def login_or_sign_up
        puts "First time, next or Last? Don't matter. Put ya name".colorize(:blue)
        @user_input = gets.chomp.downcase
        if user_valid
          puts "WELL WELL, WELCOME BACK"
          sleep 0.5
          puts "You have #{@user.points} Ye points!"
        else
            @user = User.create(name: @user_input, points: 0)
            puts "FIRST-TIMER! WELCOME!!"
            @user.points = 0
        end
       
      end

      def user_valid
        if User.find_by(name: @user_input)
          @user = User.find_by(name: @user_input)
          true
        else
          false
        end
      end

      def main_menu
        pid = fork{exec 'afplay', "lib/music/Stronger_Kanye.mp3"}
        answer = prompt.select("What's good, #{@user.name}! How would you like to start?") do |menu|
          menu.choice "Play Ye Trivia".colorize(:white)
          menu.choice "Make a Purchase".colorize(:green)
          menu.choice "View Ye Bank".colorize(:white)
          menu.choice "Update Name".colorize(:green)
          menu.choice "Leave Ye World".colorize(:red)
        end
        if answer == "Play Ye Trivia".colorize(:white)
          system "killall afplay"
          # killall afplay

          puts "OK HERE WE GO!!"
          sleep(2)
          system "clear"
          game_round(@user)
        elsif answer == "Make a Purchase".colorize(:green)
          if @user.points == 0
            puts "Play the game first, no Yeebies."
            sleep(2)
            kill_music
            main_menu
          else
              buying
          end
        elsif answer == "View Ye Bank".colorize(:white)
          if @user.points == 0
            puts "Having money's not everything. You just broke homie."
            sleep(2)
            kill_music
            main_menu
          else
            puts "#{@user.points}"
            sleep(3)
            main_menu
            kill_music
          end
        elsif answer == "Update Name".colorize(:green)
            edit_menu(@user)
            kill_music
        elsif answer == "Leave Ye World".colorize(:red)

          puts "Thanks for coming to YE WORLDDDDDDDD!"
          kill_music
          pid = fork{exec 'afplay', "lib/music/ye_haaa.mp3"}
          sleep(3)
        end

      end

      def edit_menu(user)
            answer = prompt.select("____ my name") do |menu|
              menu.choice "Change"
              menu.choice "Delete"
              menu.choice "Sike, do nada w/"
            end
            if answer == "Change"
              puts "Put in ya new name"
              user_input = gets.chomp
              if user_input == User.all.select{|user_inst| user_inst.name}
                binding.pry
                puts "This username is already taken. Please choose another"
                edit_menu(user)
              else
                user.update(name: user_input)
                kill_music
              end
              main_menu
            elsif answer == "Delete"
              @user.destroy
              kill_music
              run
            elsif answer == "Sike, do nada w/"
              main_menu
              kill_music
            end

      end

      def post_game_menu
        pid = fork{exec 'afplay', "lib/music/touch_the_sky.mp3"}
        answer = prompt.select("What would you like to do next?") do |menu|
          menu.choice "Make a Purchase"
          menu.choice "View Ye Bank"
          menu.choice "Back to Main Menu"
        end
        if answer == "Make a Purchase"
          buying
        elsif answer == "View Ye Bank"
          puts "#{@user.points}"
          post_game_menu
          kill_music
        elsif answer == "Back to Main Menu"
          kill_music
          main_menu
        end
      end

      def buying
        stuff = Product.all.map{|prod_inst| prod_inst.product_type}
        things_2_buy = self.prompt.select("Even though you may or may not love Yeezy, YEEZY MERCH FOR EVERYBODY!".colorize(:green), stuff)
        if things_2_buy == "Yeezy Shirt - 50"
          picked_prod = Product.where(product_type: things_2_buy)
          Purchase.create(user_id: @user.id, product_id: picked_prod[0].id, purchase?: true)
          @user.points -= picked_prod[0].price
          kill_music
        elsif things_2_buy == "Yeezy Pants - 50"
          picked_prod = Product.where(product_type: things_2_buy)
          Purchase.create(user_id: @user.id, product_id: picked_prod[0].id, purchase?: true)
          @user.points -= picked_prod[0].price
          kill_music
        elsif things_2_buy == "Yeezy Pop - free.99"
          picked_prod = Product.where(product_type: things_2_buy)
          Purchase.create(user_id: @user.id, product_id: picked_prod[0].id, purchase?: true)
          @user.points -= picked_prod[0].price
          kill_music
        end
        puts "Here you go! You now have #{@user.points} karma remaining Have a wonderful, Yeezy day!"
        sleep(2.5)
        main_menu
        kill_music
      end

      
####################################### Start of the game ############################################
      
      def game_round(user_instance)
        @user.points = 0 
        question_one
        sleep(3)
        system "clear"
        question_two
        @user.save
        sleep(3)
        system "clear"
        question_three
        @user.save
        sleep(3)
        system "clear"
        question_four
        @user.save
        sleep(3.5)
        system "clear"
        question_five
        @user.save
        sleep(3)
        system "clear"
        question_six
        @user.save
        sleep(3)
        system "clear"
        question_seven
        @user.save
        sleep(3)
        system "clear"
        question_eight
        @user.save
        sleep(3)
        system "clear"
        question_nine
        @user.save
        sleep(3)
        system "clear"
        question_ten
        @user.save
        sleep(3)
        system "clear"
        kanye_lover?
        sleep(5)
        system "clear"
        post_game_menu
        sleep(3)
        system "clear"
      end

      def question_one
        pid = fork{exec 'afplay', "lib/music/ye_all_falls_down.mp3"}
        prompt = TTY::Prompt.new
        answer = self.prompt.select("She couldn't afford a car so she named her daughter:") do |menu|
            menu.choice "Mercedes"
            menu.choice "Alexus"
            menu.choice "Chevy"
            menu.choice "Toyota"
        end
        if answer == "Alexus"
          @user.points += 10
          puts "ok you got the first one. #{@user.points} points!"
          #question_two
        else
          puts "get out"
        end
        @user.points
        @user.save
      end

      def question_two
          system "killall afplay"
          pid = fork{exec 'afplay', "lib/music/power_clip.mp3"}
        prompt = TTY::Prompt.new
        answer = self.prompt.select("What song does this clip from?") do |menu|
            menu.choice "Good Life"
            menu.choice "Put On"
            menu.choice "Lost"
            menu.choice "Power"
        end
        if answer == "Power"
          @user.points += 10
          puts "ok you got the second one. #{@user.points} points!"
          kill_music
        else
          puts "get out"
          kill_music
        end
        
        @user.points
        @user.save
      end

      def question_three
        pid = fork{exec 'afplay', "lib/music/gold_digger.mp3"}
        prompt = TTY::Prompt.new
        answer = self.prompt.select("What year did he release the iconic song, Gold Digger") do |menu|
            menu.choice "2005"
            menu.choice "3007"
            menu.choice "2010"
            menu.choice "2008"
        end
        if answer == "2005"
          @user.points += 10
          puts "Ok, you know a lil sumthin. #{@user.points} points!"
        else
          puts "Ehhhh wrong!!"
        end
        kill_music
        @user.points
        @user.save
      end

      def question_four
        pid = fork{exec 'afplay', "lib/music/homecoming.mp3"}
        prompt = TTY::Prompt.new
        answer = self.prompt.select("Where was Kanye born?") do |menu|
            menu.choice "New Jersey"
            menu.choice "Kardashian Land"
            menu.choice "Atlanta"
            menu.choice "Chicago"
        end
        if answer == "Atlanta"
          @user.points += 10
          puts "Ok, you know a lil sumthin. #{@user.points} points!"
        elsif answer == "Chicago"
          puts "Wrong - I actually didn't meet this girl until I was 3 years old"
        elsif answer == "Kardashian Land"
          puts "*Ye stare*"
        else
          puts "I should actually scream at you for thinkin' New Jersey"
        end
        kill_music
        @user.points
        @user.save
      end

      def question_five
        pid = fork{exec 'afplay', "lib/music/jesus_walks.mp3"}
        prompt = TTY::Prompt.new
        answer = self.prompt.select("I named one of my children after what biblical reference?") do |menu|
            menu.choice "Moses"
            menu.choice "Psalm"
            menu.choice "Jesus"
            menu.choice "Yeezus"
        end
        if answer == "Psalm"
          @user.points += 10
          puts "Ok, you know a lil sumthin. #{@user.points} points!"
        elsif answer == "Yeezus"
          @user.points += 10
          puts "Not the answer Ye was expectin, but I forgive you. You still get 10 points."
        else
          puts "Yeezy forgives you. However, you're wrong!"
        end
        kill_music
        @user.points
        @user.save
      end

      def question_six
        pid = fork{exec 'afplay', "lib/music/lollipop.mp3"}
        prompt = TTY::Prompt.new
        answer = self.prompt.select("Whose track did I destroy when he was at his peak?") do |menu|
            menu.choice "Jay-Z"
            menu.choice "50 Cent"
            menu.choice "Lil Wayne"
            menu.choice "Taylor Swift"
        end
        if answer == "Lil Wayne"
          @user.points += 10
          puts "Like I said, he ain't finna murder me like everybody else!"
        else
          puts "NO YEEZY POPS FOR YOU!"
        end
        kill_music
        @user.points
        @user.save
      end
     
      def question_seven
        pid = fork{exec 'afplay', "lib/music/ye_clothing_line.mp3"}
        prompt = TTY::Prompt.new
        answer = self.prompt.select("What was the name of Kanye's first clothing line") do |menu|
            menu.choice "Yeezy Season 1"
            menu.choice "Versaycee"
            menu.choice "We don't knowwwww"
            menu.choice "Pastelle"
        end
        if answer == "Pastelle"
          @user.points += 10
          puts "And I spent $400 buck on this!"
        elsif answer == "We don't knowwwww"
          @user.points -= 5 
          puts "Oh you think you funny?? Minus -5 points! You now have #{@user.points} points"
        else
          puts "Wrong! But, go cop that new Yeezy!"
        end
        @user.points
        @user.save
      end

      def question_eight
        pid = fork{exec 'afplay', "lib/music/nosetalgia.mp3"}
        prompt = TTY::Prompt.new
        answer = self.prompt.select("Who is the president of my record label 'GOOD MUSIC'?") do |menu|
            menu.choice "Pusha T"
            menu.choice "Travis Scott"
            menu.choice "Kanye West *third-person voice*"
            menu.choice "Mike Dean"
        end
        if answer == "Pusha T"
          @user.points += 10
          puts "Respect King Push!! GOOD MUSIC!!"
        else
          puts "We all GOOD Music! But that's wrong!"
        end
        kill_music
        @user.points
        @user.save
      end

      def question_nine
        pid = fork{exec 'afplay', "lib/music/ghetto_university.mp3"}
        prompt = TTY::Prompt.new
        answer = self.prompt.select("I had to take ha to that Ghetto ___") do |menu|
            menu.choice "Anniversary"
            menu.choice "on the count of 3"
            menu.choice "University"
            menu.choice "just to get her free"
        end
        if answer == "University"
          @user.points += 10
          puts "I know you see all of the lights!!"
        else
          puts "No! I'm John Harvard in the flesh!! ... Steve Jobs"
        end
        kill_music
  
        @user.points
        @user.save
      end

      def question_ten
        pid = fork{exec 'afplay', "lib/music/show_me_ye.mp3"}
        prompt = TTY::Prompt.new
        answer = self.prompt.select("What song did Kanye produce on Drake's debut album?") do |menu|
            menu.choice "Show Me a Good Time"
            menu.choice "Light Up"
            menu.choice "Over"
            menu.choice "Miss Me"
        end
        if answer == "Show Me a Good Time"
          @user.points += 10
          puts "It's all good Drake! KiKi loves me"
        else
          puts "Sorry, but that's wrong. But here's 1 point. Thank Me Later"
          @user.points += 1
        end
        kill_music
        @user.points
        @user.save
      end

      def kanye_lover?
        puts "Your total Ye karma is #{@user.points}."
        if @user.points == 100
          pid = fork{exec 'afplay', "lib/music/yeezytaughtme.mp3"}
          puts "Oh shit! You really do love Kanye more than Kanye loves Kanye!!"
        elsif @user.points < 100
          puts "It's a shame you even took the test, but at least you got some right."
        else @user.points = 1
          pid = fork{exec 'afplay', "lib/music/oprah_ye.mp3"}
          puts "Pathetic, but luckily Yeezy has mercy on everyone. Take ya point and get you a Yeezy Pop!"
        end
      end

      def kill_music
        system "killall afplay"
      end

      def display_ye_world
        title = TTY::Font.new(:doom)
        puts title.write("WELCOME TO YE WORLD").colorize(:red)
      end
  end


  