class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :owner_id
      t.string :title
      t.text :description

      t.string :visibility
      t.string :contributability

      t.timestamps
    end
  end
end
