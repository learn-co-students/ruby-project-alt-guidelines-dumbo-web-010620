class Session < ActiveRecord::Base
    def question_one
        answer = self.prompt.select("She couldn't afford a car so she named her daughter:") do |menu|
            menu.choice "Mercedes"
            menu.choice "Alexus"
            menu.choice "Chevy"
            menu.choice "Toyota"
        end
    end
end