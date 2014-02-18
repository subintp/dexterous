class CreateLearningResources < ActiveRecord::Migration
  def change
    create_table :learning_resources do |t|
      t.string :url
      t.string :title
      t.integer :milestone_id
      t.integer :track_id
      t.integer :owner_id
      t.text :description
      t.text :metadata
      t.timestamps
    end
  end
end
