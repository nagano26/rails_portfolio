class CreateCommentWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :comment_works do |t|
      t.integer :user_id
      t.integer :work_id
      t.text :content

      t.timestamps
    end
  end
end
