require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    merch = create(:merchant)
    create_list(:item, 3, merchant: merch)

    get '/api/v1/items'
    expect(response).to be_successful
    items = JSON.parse(response.body)
    expect(items.size).to eq(3)
  end

  it "can get an items show page" do
    merch = create(:merchant)
    id = create(:item, merchant: merch).id

    get "/api/v1/items/#{id}"
    item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(item["id"]).to eq(id)
  end
end
