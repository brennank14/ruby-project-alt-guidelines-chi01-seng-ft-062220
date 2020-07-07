class CreateCoaches < ActiveRecord::Migration[5.2]
    def change
        create_table :Coaches do |t|
            t.string :name
        end
    end
end