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


  def self.find_coach_sub_by_player(player_name)
        # this method will list all coaches for a given player
        players = Player.all.select do |player|
            player == player_name
        end
        coaches = players.map do |player|
            player.coach.name
        end
        coaches.uniq
    end
end




