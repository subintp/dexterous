class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.integer :target_id
      t.integer :target_type
      t.integer :user_id
      t.integer :associator_id

      t.boolean :can_view
      t.boolean :can_edit
      t.boolean :is_admin

      t.timestamps
    end
  end
end
