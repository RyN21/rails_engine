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

    @invoice1 = create(:invoice, customer: @customer1, merchant: @merch1, created_at: "2020-01-01")
    @invoice2 = create(:invoice, customer: @customer1, merchant: @merch2, created_at: "2020-02-01")
    @invoice3 = create(:invoice, customer: @customer2, merchant: @merch3, created_at: "2020-02-21")
    @invoice4 = create(:invoice, customer: @customer2, merchant: @merch4, created_at: "2020-09-01")

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

  it "merchants with most revenue" do
    headers = { "CONTENT_TYPE" => "application/json" }
    quantity = 2

    get "/api/v1/merchants/most_revenue?quantity=#{quantity}"
    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(result[:data].size).to eq(2)

    expect(result[:data].first[:attributes][:name]).to eq(@merch1.name)
    expect(result[:data].last[:attributes][:name]).to eq(@merch4.name)
  end

  it "merchant with most items sold" do
    headers = { "CONTENT_TYPE" => "application/json" }
    quantity = 4

    get "/api/v1/merchants/most_items?quantity=#{quantity}"
    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(result[:data].size).to eq(4)
    expect(result[:data].first[:attributes][:name]).to eq(@merch1.name)
    expect(result[:data].second[:attributes][:name]).to eq(@merch4.name)
    expect(result[:data].third[:attributes][:name]).to eq(@merch3.name)
    expect(result[:data].fourth[:attributes][:name]).to eq(@merch2.name)
  end

  it "revenue across date range" do
    headers = { "CONTENT_TYPE" => "application/json" }
    start_date = "2020-01-21"
    end_date = "2020-08-22"

    get "/api/v1/revenue?start=#{start_date}&end=#{end_date}"
    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(result[:data][:attributes][:revenue]).to eq(150.00)
    expect(result[:data][:id]).to eq(nil)
  end

  it "revenue for a merchant" do
    headers = { "CONTENT_TYPE" => "application/json" }

    get "/api/v1/merchants/#{@merch1.id}/revenue"
    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(result[:data][:attributes][:revenue]).to eq(300.00)
    expect(result[:data][:id]).to eq(nil)
  end
end
