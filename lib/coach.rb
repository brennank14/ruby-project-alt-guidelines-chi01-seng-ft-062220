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

    def self.hire_coach(name)
        self.create(name: name)
    end

    def self.coach_options
        puts "Options: \n
        Mike Tomlin         John Mitchell\n
        Randy Fitchner      Matt Canada\n
        James Daniel        Eddie Faulkner\n
        Ike Hilliard        Shaun Sarret\n
        Adrian Klemm        Keith Butler\n
        Teryl Austin        Tom Bradley\n
        Karl Dunbar         Jerry Olsavsky\n
        Danny Smith"
    end

end




