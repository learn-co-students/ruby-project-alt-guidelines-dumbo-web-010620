class Bid < ActiveRecord::Base
    belongs_to :art_dealer
    belongs_to :work_of_gif

    # change_win_status
      # bid.win == true
    # end

    # def won?
      #if jezebel colum is true, win is false
      #vice versa
    # end
end
