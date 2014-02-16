class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|

      t.timestamps
    end
  end
end
