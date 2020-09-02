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

      expect(search_result).to have_content(merch1.name)
      expect(search_result).to have_content(merch2.name)
    end
  end

  describe "Items find" do
  end
end
