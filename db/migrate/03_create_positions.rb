class CreatePositions < ActiveRecord::Migration[5.2]
    def change
        create_table :positions do |t|
            t.string :name
            t.string :abbv
        end
    end
end 