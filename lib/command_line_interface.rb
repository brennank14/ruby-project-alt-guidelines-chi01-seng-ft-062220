def greet
    puts "Welcome Steelers team member.".yellow
    puts "enter EXIT at any time to end"
end

def user_input
    puts "Are you a PLAYER or a COACH?".yellow
    team_member = gets.chomp.upcase
    if team_member == 'PLAYER'
        puts "Select a number according to the information you are looking for".yellow
        puts "1. Find your coaches"
        puts "2. Find a player to sub for you"
        puts "3. Find a all coaches for your position"

        option = gets.chomp
        if option == '1'
            puts "Name? (first and last)".yellow
            input = gets.chomp
            player = Player.where(name: input)
            puts Coach.find_coach_by_player(player)[0].green
        end

        if option == '2'
            puts "Position Abbreviation?".yellow
            Position.position_options
            input = gets.chomp.upcase
            position = Position.where(abbv: input).first
            position.find_sub.each {|player| puts player.green}
        end

        if option == '3'
            puts "Position Abbreviation?".yellow
            Position.position_options
            input = gets.chomp.upcase
            position = Position.where(abbv: input).first
            player_list = Player.where(position: position)
            puts Position.find_coach_sub_by_position(player_list)[0].green
        end

    end

    if team_member == 'COACH'
        puts "Select the number according to the information you are looking for".yellow
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
            puts "Position Abbreviation?".yellow
            Position.position_options
            input = gets.chomp.upcase
            position = Position.where(abbv: input).first
            player_list = Player.where(position: position)
            puts Position.find_coach_sub_by_position(player_list)[0].green
        end

        if option == '2'
            puts "Position Abbreviation?".yellow
            Position.position_options
            input = gets.chomp.upcase
            position = Position.where(abbv: input).first
            position.find_sub.each {|sub| puts sub.green}
        end

        if option == '3'
            coach = Coach.has_most_players.first
            puts coach.name.green
        end

        if option == '4'
            puts "Coach Name?".yellow
            input = gets.chomp
            Coach.create(name: input)
            puts "#{input} has been added to the roster.".green
        end

        if option == '5'
            puts "Position Name?".yellow
            input1 = gets.chomp
            puts "Position Abbreviation?".yellow
            input2 = gets.chomp.upcase
            Position.create(name: input1, abbv: input2)
            puts "#{input1} has been added to the roster.".green
        end

        if option == '6'
            puts "Player Name?".yellow
            input1 = gets.chomp
            puts "Player Position Abbreviation?".yellow
            Position.position_options
            input2 = gets.chomp.upcase
            pos = Position.find_by(abbv: input2)


            puts "Player's Coach?".yellow
            Coach.coach_options
            input3 = gets.chomp
            coach = Coach.find_by(name: input3)

            puts "Player's age?".yellow
            input4 = gets.chomp

            puts "Player's Number?".yellow
            input5 = gets.chomp

            Player.create(name: input1, position: pos, coach: coach, age: input4, number: input5)
            puts "Player #{input1} has been added to the roster".green
        end

        if option == '7'
            puts "Name of player?".yellow
            input = gets.chomp
            Player.where(name: input).destroy_all
            puts "#{input} has been deleted from the roster".green
        end

        if option == '8'
            puts "Name of coach?".yellow
            Coach.coach_options
            input = gets.chomp
            Coach.where(name: input).destroy_all
            puts "#{input} has been deleted from the roster".green
        end

        if option == '9'
            puts "Player name?".yellow
            input = gets.chomp
            puts "New position abbreviation?".yellow
            Position.position_options
            input2 = gets.chomp.upcase
            player = Player.find_by(name: input)
            position = Position.find_by(abbv: input2)
            player.update(position: position)
            puts "#{input}'s position has been changed to #{input2}".green
        end

        if option == '10'
            puts "Player name?".yellow
            input = gets.chomp
            puts "New coach?".yellow
            Coach.coach_options
            input2 = gets.chomp
            player = Player.find_by(name: input)
            coach = Coach.find_by(name: input2)
            player.update(coach: coach)
            puts "#{input}'s coach has been changed to #{input2}".green
        end

    end

    puts "Enter GO to see options again. Enter anything else if you are finished.".red
    input = gets.chomp.upcase
    if input == 'GO'
        user_input
    end
end