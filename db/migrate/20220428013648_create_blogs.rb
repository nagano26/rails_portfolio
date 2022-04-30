class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.integer :user_id
      t.string :title_blog
      t.text :body_blog
      t.string :blog_image_id

      t.timestamps
    end
  end
end
