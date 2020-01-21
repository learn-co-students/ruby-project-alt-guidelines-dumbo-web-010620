class User < ActiveRecord::Base
    def self.returning_user
        puts "If you've been here before, what's your name?"
        name = gets.chomp
        User.find_by(name: name)
      end
    
      def self.new_user
        puts "If this is new for you, enter your name"
        name = gets.chomp
        User.create(name: name)
      end
end