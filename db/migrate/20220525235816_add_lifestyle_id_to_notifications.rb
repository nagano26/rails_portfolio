class AddLifestyleIdToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :lifestyle_id, :integer
  end
end
