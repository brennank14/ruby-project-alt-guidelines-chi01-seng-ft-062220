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

    def self.find_coach_sub_by_position(array)
        # this method will list all coaches for a given position
        coaches = array.map do |player|
            player.coach_id
        end
        coaches_names = coaches.map do |id|
            Coach.find_by(id: id).name
        end
        coaches_names.uniq
    end

    def self.find_coach_sub_by_position2(array)
        # this method will list all coaches for a given position
        coaches = array.map do |position|
            position.coach_id
        end
        coaches_names = coaches.map do |id|
            Coach.find_by(id: id).name
        end
        coaches_names.uniq
    end

    def self.position_options
        puts "Options: \n"
        "C: Center               OG: Offensive Guard \n"
        position = Position.all.map{|position| "#{position.abbv}: #{position.name}"}
        position.in_groups_of(2) {|position1, position2| puts "#{position1}                 #{position2} \n"}
    end
end