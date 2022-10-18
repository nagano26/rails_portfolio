class CreateCommentLifestyles < ActiveRecord::Migration[7.0]
  def change
    create_table :comment_lifestyles do |t|
      t.integer :user_id
      t.integer :lifestyle_id
      t.text :content

      t.timestamps
    end
  end
end
