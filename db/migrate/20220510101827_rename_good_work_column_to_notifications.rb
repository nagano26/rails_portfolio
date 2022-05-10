class RenameGoodWorkColumnToNotifications < ActiveRecord::Migration[7.0]
  def change
    rename_column :notifications, :good_work, :comment_work
  end
  
  add_index :notifications, :comment_work_id
end
