require 'rails_helper'

describe "Budiness Intelligence Endpoints" do
  before :each do
    @merch1 = create(:merchant)
    @merch2 = create(:merchant)
    @merch3 = create(:merchant)
    @merch4 = create(:merchant)
    @merch5 = create(:merchant)

    @item1 = create(:item, merchant: @merch1, unit_price: 10.00)
    @item2 = create(:item, merchant: @merch1, unit_price: 10.00)
    @item3 = create(:item, merchant: @merch2, unit_price: 10.00)
    @item4 = create(:item, merchant: @merch2, unit_price: 10.00)
    @item5 = create(:item, merchant: @merch3, unit_price: 10.00)
    @item6 = create(:item, merchant: @merch3, unit_price: 10.00)
    @item7 = create(:item, merchant: @merch4, unit_price: 10.00)
    @item8 = create(:item, merchant: @merch4, unit_price: 10.00)

    @customer1 = create(:customer)
    @customer2 = create(:customer)

    @invoice1 = create(:invoice, customer: @customer1, merchant: @merch1)
    @invoice2 = create(:invoice, customer: @customer1, merchant: @merch2)
    @invoice3 = create(:invoice, customer: @customer2, merchant: @merch3)
    @invoice4 = create(:invoice, customer: @customer2, merchant: @merch4)

    @invoice_item1 = create(:invoice_item, invoice_id: @invoice1.id, item_id: @item1.id, quantity: 10, unit_price: 10.00)
    @invoice_item2 = create(:invoice_item, invoice_id: @invoice1.id, item_id: @item1.id, quantity: 10, unit_price: 10.00)
    @invoice_item3 = create(:invoice_item, invoice_id: @invoice1.id, item_id: @item1.id, quantity: 10, unit_price: 10.00)
    @invoice_item4 = create(:invoice_item, invoice_id: @invoice2.id, item_id: @item1.id, quantity:  5, unit_price: 10.00)
    @invoice_item5 = create(:invoice_item, invoice_id: @invoice3.id, item_id: @item1.id, quantity: 10, unit_price: 10.00)
    @invoice_item6 = create(:invoice_item, invoice_id: @invoice4.id, item_id: @item1.id, quantity: 10, unit_price: 10.00)
    @invoice_item7 = create(:invoice_item, invoice_id: @invoice4.id, item_id: @item1.id, quantity: 10, unit_price: 10.00)

    @sales1 = create(:sale, invoice_id: @invoice1.id)
    @sales1 = create(:sale, invoice_id: @invoice2.id)
    @sales1 = create(:sale, invoice_id: @invoice3.id)
    @sales1 = create(:sale, invoice_id: @invoice4.id)
  end

  it "has merchants with most revenue" do
    headers = { "CONTENT_TYPE" => "application/json" }
    quantity = 2

    get "/api/v1/merchants/most_revenue?quantity=#{quantity}"
    results = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
    expect
  end
end
