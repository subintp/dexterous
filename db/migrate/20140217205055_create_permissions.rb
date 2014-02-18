class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :user_id
      t.integer :track_id

      t.boolean :can_view
      t.boolean :can_edit
      t.boolean :can_contribute
      t.boolean :can_manage

      t.timestamps
    end
  end
end
