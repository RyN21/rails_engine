class ChangeColumnNameInSales < ActiveRecord::Migration[5.2]
  def change
    rename_column :sales, :credit_card_number_expiration_date, :credit_card_expiration_date
  end
end
