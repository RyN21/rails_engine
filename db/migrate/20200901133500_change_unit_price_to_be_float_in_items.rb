class ChangeUnitPriceToBeFloatInItems < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :unit_price, :float
  end

  def down
    change_column :items, :unit_price, :integer
  end
end
