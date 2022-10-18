class AddRoomIdToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :room_id, :integer
  end
end
