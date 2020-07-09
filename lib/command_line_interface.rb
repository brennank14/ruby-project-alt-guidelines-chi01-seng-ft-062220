
def greet
    puts "Welcome Steelers team member."
end

def user_input
    puts "Are you a PLAYER or a COACH?"
    team_member = gets.chomp
    if team_member == 'PLAYER'
        puts "Select a number according to the information you are looking for"
        puts "1. Find your coaches"
        puts "2. Find a player to sub for you"
        puts "3. Find a all coaches for your position"

        option = gets.chomp
        if option == '1'
            puts "Name?"
            input = gets.chomp
            player = Player.where(name: input)
            puts Coach.find_coach_by_player(player)
        end

        # if option == '2'
        #     puts "Position?"
        #      puts "Options: ..."
        #     input = gets.chomp
        #     position = Player.where(position: input).first
        #     binding.pry
        #     puts position.find_sub
        # end

        # if option == '3'
        #     puts "Position?"
        #       puts "Options: ..."
        #     input = gets.chomp
        #     coach = Player.where(position: input)
        #     puts find_coach_sub_by_position(coach)
        # end

    end

    if team_member == 'COACH'
        puts "Select the number according to the information you are looking for"
        puts "1. Find a coach to sub for you"
        puts "2. Find all players for a certain position"
        puts "3. Find who coaches the most players"

        option = gets.chomp
        if option == '1'
            puts "Position?"
            puts "Options: ..."
            input = gets.chomp
            position = Position.where(name: input).first
            puts position.find_coach_sub_by_position
        end

        if option == '2'
            puts "Position?"
            puts "Options: ..."
            input = gets.chomp
            position = Position.where(name: input).first
            puts position.find_sub
        end

        if option == '3'
            coach = Coach.has_most_players.first
            puts coach.name
        end

    end

end
    
