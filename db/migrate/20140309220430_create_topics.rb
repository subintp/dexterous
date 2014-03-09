class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :subscription
      t.string :update

      t.timestamps
    end
  end
end
