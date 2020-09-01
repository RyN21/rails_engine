require 'csv'

namespace :db do
  desc "Imports csv files into the data"
  task import_csv: :environment do
    info = {Customer    => "db/data/csv_files/customers.csv",
            Merchant    => "db/data/csv_files/merchants.csv",
            Item        => "db/data/csv_files/items.csv"}
            # Transaction => "db/data/csv_files/transactions.csv",
            # Invoice     => "db/data/csv_files/invoices.csv",
            # InvoiceItem => "db/data/csv_files/invoice_items.csv"}

    info.each do |object, path|
      object.destroy_all
      CSV.foreach(path, headers: true) do |row|
        if row[:unit_price]
          row[:unit_price] = row[:unit_price].to_f / 100
        end
        object.create!(row.to_hash)
      end
    end
  end
end


# namespace :csv_import do
#   desc "Seed data.csv from db/data/csv_files to database table"
#
#   task customers: :environment do
#     data = CSV.read("db/data/csv_files/customers.csv")
#     data.each do |row|
#       Customer.create(first_name: row[1],
#                       last_name:  row[2])
#     end
#
#     puts("File imported")
#   end
#
#   task invoice_items: :environment do
#     data = CSV.read("db/data/csv_files/invoice_items.csv")
#     data.each do |row|
#       InvoiceItem.create(item_id:    row[1],
#                          invoice_id: row[2],
#                          quantity:   row[3],
#                          unit_price: row[4])
#     end
#     require "pry"; binding.pry
#     puts("File imported")
#   end
#
#   task invoices: :environment do
#     data = CSV.read("db/data/csv_files/invoices.csv")
#     data.each do |row|
#       Invoice.create(customer_id: row[1],
#                      merchant_id: row[2],
#                      status:      row[3])
#     end
#     puts("File imported")
#   end
#
#   task items: :environment do
#     require 'csv'
#     data = CSV.read("db/data/csv_files/items.csv")
#     data.each do |row|
#       Item.create(name:        row[1],
#                   description: row[2],
#                   unit_price:  row[3],
#                   merchant_id: row[4])
#     end
#     require "pry"; binding.pry
#     puts("File imported")
#   end
#
#   task merchants: :environment do
#     require 'csv'
#     data = CSV.read("db/data/csv_files/merchants.csv")
#     data.each do |row|
#       Merchant.create(name: row[1])
#     end
#     puts("File imported")
#   end
#
#   task transactions: :environment do
#     require 'csv'
#     data = CSV.read("db/data/csv_files/transactions.csv")
#     data.each do |row|
#       Transaction.create(invoice_id:                  row[1],
#                          credit_card_number:          row[2],
#                          credit_card_expiration_date: row[3],
#                          result:                      row[4])
#     end
#     puts("File imported")
#   end
# end
