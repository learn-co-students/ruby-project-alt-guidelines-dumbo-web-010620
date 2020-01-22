require "tty-prompt"
require "pry"

class Test

    
#     def menu
#      prompt = TTY::Prompt.new

#         results = prompt.collect do
#         key(:location).ask('Enter Borough:')

#         key(:color).ask('color?:')
      
       
#       end
#       puts results
#     end
# end


def run
bike_selection

end





def self.find_location(location)
    self.where(location: location)
end

def bike_selection
    prompt = TTY::Prompt.new
    
    prompt.select("Select location of bike") do |menu|
        menu.choice "Bronx", -> {@array = Bike.find_location("Bronx"), color_selection}
        # menu.choice "Queens", -> {@location_array = Bike.all.select{|bikes| bikes.location = "Queens"}, color_selection}
        # menu.choice "Brooklyn", -> {@location_array = Bike.all.select{|bikes| bikes.location = "Brooklyn"}, color_selection}
        # menu.choice "Manhattan", -> {@location_array = Bike.all.select{|bikes| bikes.location = "Manhattan"}, color_selection}
        # menu.choice "Staten Island", -> {@location_array = Bike.all.select{|bikes| bikes.location = "Staten Island"}, color_selection}
    end
end

def color_selection
    prompt = TTY::Prompt.new
    prompt.select("Select color of bike") do |menu|

        menu.choice "Red", -> {}
        menu.choice "Blue", -> {}
        menu.choice "Yellow", -> {}
        menu.choice "Black", -> {}
        menu.choice "White", -> {}
        menu.choice "Green", -> {}
    end
end







# def build_bike
#      puts bike_hash = {color: @selection[1], location: @selection[0], price: @price}
# end
# end

#binding.pry
end