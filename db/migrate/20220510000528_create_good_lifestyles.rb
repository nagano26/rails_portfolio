class CreateGoodLifestyles < ActiveRecord::Migration[7.0]
  def change
    create_table :good_lifestyles do |t|
      t.integer :user_id
      t.integer :lifestyle_id

      t.timestamps
    end
  end
end
