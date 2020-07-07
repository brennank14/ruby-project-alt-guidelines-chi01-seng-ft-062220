class CreatePlayer < ActiveRecord::Migrate
    def change
        create_table :players do |t|
            t.string :name
            t.integer :position_id
            t.integer :coach_id
            t.integer :number
        end
    end
end