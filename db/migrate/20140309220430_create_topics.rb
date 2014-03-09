class CreateTopics < ActiveRecord::Migration
    def change
        create_table :topics do |t|
            t.integer :subject_id
            t.integer :subject_type
            t.timestamps
        end
    end
end
