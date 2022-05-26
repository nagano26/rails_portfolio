class CreateNormals < ActiveRecord::Migration[7.0]
  def change
    create_table :normals do |t|
      t.integer :user_id
      t.string :before_address
      t.string :current_address
      t.text :trigger
      t.text :preparation

      t.timestamps
    end
  end
end
