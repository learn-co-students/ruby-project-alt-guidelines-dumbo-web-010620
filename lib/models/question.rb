class Question < ActiveRecord::Base
    has_many :userquestions
    has_many :users, through: :userquestions
    
    # def question_one
    #     answer = self.prompt.select("She couldn't afford a car so she named her daughter:") do |menu|
    #         menu.choice "Mercedes"
    #         menu.choice "Alexus"
    #         menu.choice "Chevy"
    #         menu.choice "Toyota"
    #     end
    #     if answer == "Alexus"
    #         points += 10
    #     else
    #         points 
    #     end
    # end
end