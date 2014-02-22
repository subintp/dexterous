class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :user_id
      t.integer :track_id
      t.datetime :enrolled_at
      t.datetime :completed_at
    end
  end
end
