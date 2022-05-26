class AddWorkIdToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :work_id, :integer
  end
end
