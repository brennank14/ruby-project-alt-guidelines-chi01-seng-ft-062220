
def greet
    puts "Welcome Steelers team member."
    puts "enter EXIT at any time to end"
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
            puts "Name? (first and last)"
            input = gets.chomp
            player = Player.where(name: input)
            puts Coach.find_coach_by_player(player)
        end

        if option == '2'
            puts "Position Abbreviation?"
            Position.position_options
            input = gets.chomp
            position = Position.where(abbv: input).first
            puts position.find_sub
        end

        if option == '3'
            puts "Position Abbreviation?"
            Position.position_options
            input = gets.chomp
            position = Position.where(abbv: input).first
            player_list = Player.where(position: position)
            puts Position.find_coach_sub_by_position(player_list)
        end

    end

    if team_member == 'COACH'
        puts "Select the number according to the information you are looking for"
        puts "1. Find a coach to sub for you"
        puts "2. Find all players for a certain position"
        puts "3. Find who coaches the most players"
        puts "4. Add coach to roster"
        puts "5. Create a new position"
        puts "6. Add player to roster"
        puts "7. Delete player from roster"
        puts "8. Delete coach from roster"
        puts "9. Update player's position"
        puts "10. Update player's coach"

        option = gets.chomp
        if option == '1'
            puts "Position Abbreviation?"
            Position.position_options
            input = gets.chomp
            position = Position.where(abbv: input).first
            player_list = Player.where(position: position)
            puts Position.find_coach_sub_by_position(player_list)
        end

        if option == '2'
            puts "Position Abbreviation?"
            Position.position_options
            input = gets.chomp
            position = Position.where(abbv: input).first
            puts position.find_sub
        end

        if option == '3'
            coach = Coach.has_most_players.first
            puts coach.name
        end

        if option == '4'
            puts "Coach Name?"
            input = gets.chomp
            Coach.create(name: input)
            puts "#{input} has been added to the roster."
        end

        if option == '5'
            puts "Position Name?"
            input1 = gets.chomp
            puts "Position Abbreviation?"
            input2 = gets.chomp
            Position.create(name: input1, abbv: input2)
            puts "#{input1} has been added to the roster."
        end

        if option == '6'
            puts "Player Name?"
            input1 = gets.chomp
            puts "Player Position Abbreviation?"
            Position.position_options
            input2 = gets.chomp
            pos = Position.find_by(abbv: input2)


            puts "Player's Coach?"
            Coach.coach_options
            input3 = gets.chomp
            coach = Coach.find_by(name: input3)

            puts "Player's age?"
            input4 = gets.chomp

            puts "Player's Number?"
            input5 = gets.chomp

            Player.create(name: input1, position: pos, coach: coach, age: input4, number: input5)
            puts "Player #{input1} has been added to the roster"
        end

        if option == '7'
            puts "Name of player?"
            input = gets.chomp
            Player.where(name: input).destroy_all
            puts "#{input} has been deleted from the roster"
        end

        if option == '8'
            puts "Name of coach?"
            Coach.coach_options
            input = gets.chomp
            Coach.where(name: input).destroy_all
            puts "#{input} has been deleted from the roster"
        end

        if option == '9'
            puts "Player name?"
            input = gets.chomp
            puts "New position abbreviation?"
            Position.position_options
            input2 = gets.chomp
            player = Player.find_by(name: input)
            position = Position.find_by(abbv: input2)
            player.position = position
            player.save
            puts "#{input}'s position has been changed to #{input2}"
        end

        if option == '10'
            puts "Player name?"
            input = gets.chomp
            puts "New coach?"
            Coach.coach_options
            input2 = gets.chomp
            player = Player.find_by(name: input)
            coach = Coach.find_by(name: input2)
            player.coach = coach
            player.save
            puts "#{input}'s coach has been changed to #{input2}"
        end

    end

    puts "Enter GO to see options again. Enter anything else if you are finished."
    input = gets.chomp
    if input == 'GO'
        user_input
    end


end
    
