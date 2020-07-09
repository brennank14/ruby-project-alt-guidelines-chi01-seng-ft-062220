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
        puts "Options: \n
        C: Center               OG: Offensive Guard \n
        OT: Offensive Tackle    QB: Quarter Back \n
        RB: Running Back        WR: Wide Receiver \n
        TE: Tight End           S: Safety \n
        K: Kicker               P: Punter \n
        LB: Line Backer         FB: Full Back \n
        DB: Defensive Back      DE: Defensive End \n
        DT: Defensive Tackle    OL: Outside Linebacker \n
        CB: Corner Back          NT: Nose Tackle \n
        LS: Long Snapper        G: Guard"
    end




end