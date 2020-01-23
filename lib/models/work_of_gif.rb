class WorkOfGif < ActiveRecord::Base
    has_many :bids
    has_many :art_dealers, through: :bids

    def self.visit_gif_shoppe
        WorkOfGif.all.map {|workofgif| puts workofgif.name} #can view all available WOG
    end

    def change_availability
        self.available = false
        #if workofgif is won (win column: true), change availability to false. This means it won't be in the gifshoppe.
        #if workofgif is stolen(t)
    end

    def stolen?
        if self.stolen == true
            change_availability
        #if the wog's stolen column = true, change availability to false.
        #Also will be not be able to view in ArtDealer's gifgallery
        #if wog's stolen column = false, it was not stolen, still available
        end

        # call destroy on WOG instance
    end
end
