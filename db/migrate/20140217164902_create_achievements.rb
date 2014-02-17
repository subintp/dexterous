class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.integer :user_id
      t.integer :milestone_id
      t.integer :duration
      t.integer :score
      t.timestamps
    end
  end
end
