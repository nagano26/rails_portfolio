class CreateGoodWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :good_works do |t|
      t.integer :user_id
      t.integer :work_id

      t.timestamps
    end
  end
end
