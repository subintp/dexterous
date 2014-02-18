class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.integer :owner_id
      t.integer :track_id
      t.string :title
      t.text :description
      t.integer :expected_duration
      t.integer :score
      t.timestamps
    end
  end
end
