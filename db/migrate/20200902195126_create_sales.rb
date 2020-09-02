class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.string :credit_card_number
      t.string :credit_card_number_expiration_date
      t.string :result

      t.timestamps
    end
  end
end
