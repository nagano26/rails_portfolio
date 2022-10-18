class AddNormalIdToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :normal_id, :integer
  end
  
end
