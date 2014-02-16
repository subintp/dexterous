class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.integer :creator_id
      t.integer :track_id
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
