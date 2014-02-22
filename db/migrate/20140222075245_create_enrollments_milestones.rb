class CreateEnrollmentsMilestones < ActiveRecord::Migration
  def change
    create_table :enrollments_milestones do |t|
      t.integer :enrollment_id
      t.integer :milestone_id
    end
  end
end
