class CreateWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :works do |t|
      t.integer :user_id
      t.string :before_work
      t.string :current_work
      t.string :others_work
      t.text :message_work

      t.timestamps
    end
  end
end
