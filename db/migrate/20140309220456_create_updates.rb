class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|

      t.timestamps
    end
  end
end
