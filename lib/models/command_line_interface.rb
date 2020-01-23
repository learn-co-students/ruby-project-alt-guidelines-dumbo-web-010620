require "tty-prompt"
##

class CommandLineInterface
    attr_accessor :prompt, :user, :art_dealer, :ad, :pw, :sw, :dv

    def initialize()
        @prompt = TTY::Prompt.new
        @ad = ArtDealer.create(name: "user")
        @pw = WorkOfGif.all.first
        @sw = WorkOfGif.all.second
        @dv = WorkOfGif.all.third
    end

    def welcome
        puts "************** Welcome to the GifShoppe! ************************"
        puts "World renowned one stop shop for all things GIF!"
        answer = self.prompt.select("Have you been to the GifShoppe in a past life?", [
            "Yes",
            "No"
        ])

        welcome_handler(answer)
    end


    def welcome_handler(choice)
        case choice
        when "No"
            puts "Excellent, we hope you enjoy this lovely experience."

        when "Yes"
            puts "Welcome back."
        end

        main_menu
    end

    def main_menu
    
        system "clear" # Clears the page user is on, like going to the next screen
        # user.reload <- most likely including later
        prompt.select("Welcome prospective ArtDealer! What strikes your fancy?") do |menu|
            menu.choice "Visit the GifShoppe", -> {gif_shoppe}
            menu.choice "View your bids", -> {ad.view_bids}
            menu.choice "Peruse your GifGallery", -> {ad.view_your_won_works}
            menu.choice "Exit the GifShoppe", -> {exit_the_gif_shoppe}
        end
        STDIN.getch
        main_menu
    end


    # def gif_shoppe_menu
      # Maybe we can use prompt.select here
      # we'd call WOG.all.map and store it in a variable
      # so we could call something like menu.choice "gif[0].name", -> {bid menu}
      # and so on
    # end

    # def bid_menu(gif[0])
      # Could take an argument of a WOG instance
      # we'd need a helper method that just shows WOG name and image?

      # then we could have a sub menu with our bid and exit buttons
      # we'd need a helper method with like bid.create in it
      # possibly in art _dealer.rb (gonna pseudocode that there for now)
      # Then start bid sequence
    #

    # def bid_sequence(wog)
    #   # puts "bid amount and ask how much you want to bid"
    #   bid_amount = gets.chomp.to_i
    #   ad.create_bid(bid_amount, self.id, wog.id, #win defalt to false, #counter defalts to 1)
    #   puts ad.bids.find_by(wog.id)
    # end
# These should probably go into the gif_shoppe rb file
    
    def exit_the_gif_shoppe
      puts "Thanks for visiting the GifShoppe!"
      exit
    end

end
