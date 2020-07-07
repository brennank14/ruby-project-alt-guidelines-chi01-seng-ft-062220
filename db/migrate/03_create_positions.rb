class CreatePositions < ActiveRecord::Migration[5.2]
    def change
        create_table :Positions do |t|
            t.string :name
        end
    end
end 