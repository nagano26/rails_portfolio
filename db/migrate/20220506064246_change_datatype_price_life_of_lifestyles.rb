class ChangeDatatypePriceLifeOfLifestyles < ActiveRecord::Migration[7.0]
  def change
    change_column :lifestyles, :price_life, :string
  end
end
