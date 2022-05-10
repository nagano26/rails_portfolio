class AddNormalIdToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :normal_id, :integer
  end
  
  add_index :notifications, :normal_id
end
