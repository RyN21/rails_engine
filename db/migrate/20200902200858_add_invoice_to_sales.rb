class AddInvoiceToSales < ActiveRecord::Migration[5.2]
  def change
    add_reference :sales, :invoice, foreign_key: true
  end
end
