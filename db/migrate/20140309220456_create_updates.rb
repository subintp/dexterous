class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.integer :topic_id
      t.string :message
      t.timestamps
    end
  end
end
