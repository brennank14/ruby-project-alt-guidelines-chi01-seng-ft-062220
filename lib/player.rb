class Player < ActiveRecord::Base
    belongs_to :coach
    belongs_to :position
    
end
