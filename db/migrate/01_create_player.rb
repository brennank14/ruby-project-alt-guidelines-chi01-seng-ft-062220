class CreatePlayer < ActiveRecord::Migration[5.2]
    def change
        create_table :players do |t|
            t.string :name
            t.integer :position_id
            t.integer :coach_id
            t.integer :number
            t.integer :age
        end
    end
end