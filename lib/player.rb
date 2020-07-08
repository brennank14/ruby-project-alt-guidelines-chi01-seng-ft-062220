class Player < ActiveRecord::Base
    belongs_to :coach
    belongs_to :position

    def add_player(coach, position)
        self.create(:coach => coach, :position => position)
    end
    
    
end
