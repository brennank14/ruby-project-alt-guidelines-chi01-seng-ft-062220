class Coach < ActiveRecord::Base
  has_many :players
  has_many :positions, through: :players

  def self.has_most_players
    #this method will find the coach that coaches the most players
    coaches = Player.all.map do |player|
        player.coach
    end
    counter = Hash.new(0)
    coaches.each do |count|
        counter[count] +=1
    end
    counter.max_by{|coaches, count| count}
  end

  def self.find_coach_by_player(player)
        player.map do |players|
             players.coach.name
        end
    end

    def self.coach_options
        puts "Options: \n"
        coaches = Coach.all.map {|coaches| coaches.name}
        coaches.in_groups_of(2) {|coach1, coach2| puts "#{coach1}         #{coach2}\n"}
    end
end