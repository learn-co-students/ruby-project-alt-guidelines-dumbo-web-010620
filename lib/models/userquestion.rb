class UserQuestion < ActiveRecord::Base
    belongs_to :user
    belongs_to :question
    
    # points = 0
    # def question_one
    #     answer = self.prompt.select("She couldn't afford a car so she named her daughter:") do |menu|
    #         menu.choice "Mercedes"
    #         menu.choice "Alexus"
    #         menu.choice "Chevy"
    #         menu.choice "Toyota"
    #     end
    # end
end