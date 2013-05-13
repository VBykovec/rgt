class ChangeTypesForTasks < ActiveRecord::Migration
  def change
    rename_column :tasks, :priority, :position
  end
end
