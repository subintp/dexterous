class CreateLearningResources < ActiveRecord::Migration
  def change
    create_table :learning_resources do |t|

      t.timestamps
    end
  end
end
