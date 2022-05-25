class AddMessageIdToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :message_id, :integer
  end
end
