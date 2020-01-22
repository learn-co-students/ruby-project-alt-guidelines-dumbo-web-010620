require "tty-prompt"
class Test

    def menu
    prompt = TTY::Prompt.new

        prompt.select("Choose your destiny?") do |menu|
            menu.choice 'Scorpion', 1
            menu.choice 'Kano', 2
            menu.choice 'Jax', -> { puts 'Nice choice captain!' }
        end
    end
end