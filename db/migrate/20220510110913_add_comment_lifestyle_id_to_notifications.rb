class AddCommentLifestyleIdToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :comment_lifestyle_id, :integer
  end

  add_index :notifications, :comment_lifestyle_id
end
