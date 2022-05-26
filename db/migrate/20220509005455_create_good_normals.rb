class CreateGoodNormals < ActiveRecord::Migration[7.0]
  def change
    create_table :good_normals do |t|
      t.integer :user_id
      t.integer :normal_id

      t.timestamps
    end
  end
end
