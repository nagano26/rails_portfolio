class AddCommentWorkIdToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :comment_work_id, :integer
  end
end
