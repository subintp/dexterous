class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|

      t.timestamps
    end
  end
end
