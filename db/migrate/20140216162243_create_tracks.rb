class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :creator_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
