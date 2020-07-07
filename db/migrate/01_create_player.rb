class CreatePlayer < ActiveRecord::Migration[5.2]
    def change
        create_table :Players do |t|
            t.string :name
            t.integer :position_id
            t.integer :coach_id
            t.integer :number
        end
    end
end