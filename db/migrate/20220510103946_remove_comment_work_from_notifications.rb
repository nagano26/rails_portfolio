class RemoveCommentWorkFromNotifications < ActiveRecord::Migration[7.0]
  def change
    remove_column :notifications, :comment_work, :integer
  end
end
