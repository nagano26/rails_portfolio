class RemoveGoodLifestyleFromNotifications < ActiveRecord::Migration[7.0]
  def change
    remove_column :notifications, :good_lifestyle, :integer
  end
end
