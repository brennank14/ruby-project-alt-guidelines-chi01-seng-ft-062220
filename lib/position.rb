class Position < ActiveRecord::Base
    has_many :players
    has_many :coaches, through: :players

    def self.most_popular_position
        #this method will find the position with the most players
        positions = Player.all.map do |player|
            player.position
        end
        counter = Hash.new(0)
        positions.each do |count|
            counter[count] +=1
        end
        counter.max_by{|position,count| count}
    end

    def find_sub
        #this method will find players in the same position as the position passed in
        positions = Player.all.select do |player|
            player.position == self
        end
        positions.map do |player|
            player.name
        end
    end

    def find_coach_sub_by_position
        # this method will list all coaches for a given position
        players = Player.all.select do |player|
            player.position == self
        end
        coaches = players.map do |player|
            player.coach.name
        end
        coaches.uniq
    end



end