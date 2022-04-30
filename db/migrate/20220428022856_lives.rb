class Lives < ActiveRecord::Migration[7.0]
  def change
    drop_table :lives
  end
end
