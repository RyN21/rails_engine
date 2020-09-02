require 'rails_helper'

describe "Find endpoints" do
  describe "Merchants find" do
    it "has single finders for merchants" do
      merch1 = create(:merchant)
      merch2 = create(:merchant)
      merch3 = create(:merchant)
      merch2 = create(:merchant)

      value = merch1.name

      get "/api/v1/merchants/find?attribute=#{value}"
      search_result = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(search_result[:data][:attributes][:name]).to eq(merch1.name)
    end

    it "can find multiple records for merchants" do
      merch1 = create(:merchant, name: "Ring store")
      merch2 = create(:merchant, name: "Turing")
      merch3 = create(:merchant, name: "Shop")
      merch4 = create(:merchant, name: "Merchant")

      value = "ring"

      get "/api/v1/merchants/find_all?attribute=#{value}"
      search_result = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(search_result[:data].first[:attributes][:name]).to eq(merch1.name)
      expect(search_result[:data].second[:attributes][:name]).to eq(merch2.name)
      expect(search_result[:data].size).to eq(2)
    end
  end

  describe "Items find" do
    it "can search for a single item" do
      merch = create(:merchant)
      item1 = create(:item, merchant: merch, name: "Ring")
      item2 = create(:item, merchant: merch, name: "Turing")
      item3 = create(:item, merchant: merch, name: "Ringo")
      item4 = create(:item, merchant: merch, name: "Gnir")

      value = item3.name

      get "/api/v1/items/find?attribute=#{value}"
      search_result = JSON.parse(response.body, symbolize_names: true)
      expect(search_result[:data][:attributes][:name]).to eq(item3.name)
    end

    it "can find multiple records for items" do
      merch = create(:merchant)
      item1 = create(:item, merchant: merch, name: "Ring")
      item2 = create(:item, merchant: merch, name: "Turing")
      item3 = create(:item, merchant: merch, name: "Ringo")
      item4 = create(:item, merchant: merch, name: "Gnir")

      value = "ring"

      get "/api/v1/items/find_all?attribute=#{value}"
      search_result = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(search_result[:data].first[:attributes][:name]).to eq(item1.name)
      expect(search_result[:data].first[:type]).to eq("item")
      expect(search_result[:data].first[:id]).to eq(item1.id.to_s)
      expect(search_result[:data].second[:attributes][:name]).to eq(item2.name)
      expect(search_result[:data].third[:attributes][:name]).to eq(item3.name)
      expect(search_result[:data].size).to eq(3)
    end
  end
end
