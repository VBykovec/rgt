class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.integer :priority
      t.string :description
      t.boolean :status
      t.date :deadline

      t.timestamps
    end
  end
end
