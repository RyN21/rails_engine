require 'rails_helper'

describe "Merchant API" do
  it "index of merchant" do
    create_list(:merchant, 4)

    get '/api/v1/merchants'
    expect(response).to be_successful
    merchants = JSON.parse(response.body, symbolize_names: true)
    expect(merchants[:data].size).to eq(4)
  end

  it "show page of merchant" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"
    merchant = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(merchant[:data][:id].to_i).to eq(id)
  end

  it "create an merchant" do
    merchant_params = {name: "Rock Gear"}
    headers = { "CONTENT_TYPE" => "application/json" }

    post '/api/v1/merchants', params: JSON.generate(merchant_params), headers: headers
    merchant = Merchant.last
    expect(response).to be_successful
    expect(merchant.name).to eq(merchant_params[:name])
  end

  it "update a record of an merchant" do
    id = create(:merchant).id
    previous_name = Merchant.last.name
    merchant_params   = { name: "Climbing Gear" }
    headers = { "CONTENT_TYPE" => "application/json" }

    put "/api/v1/merchants/#{id}", params: JSON.generate(merchant_params), headers: headers
    merchant = Merchant.find_by(id: id)

    expect(response).to be_successful
    expect(merchant.name).to_not eq(previous_name)
    expect(merchant.name).to eq("Climbing Gear")
  end

  it "destroy a record of an merchant" do
    merchant  = create(:merchant)

    expect{ delete "/api/v1/merchants/#{merchant.id}" }.to change(Merchant, :count).by(-1)
    expect{Merchant.find(merchant.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end

describe 'relationships' do
  it "merchant has items endpoints" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    item1 = create(:item, merchant: merchant1)
    item2 = create(:item, merchant: merchant1)
    item3 = create(:item, merchant: merchant1)
    item4 = create(:item, merchant: merchant2)

    get "/api/v1/merchants/#{merchant1.id}/items"

    expect(response).to be_successful
    merchants_items = JSON.parse(response.body, symbolize_names: true)
    expect(merchants_items[:data].size).to eq(3)
    expect(merchants_items[:data].first[:id].to_i).to eq(item1.id)
    expect(merchants_items[:data].last[:id].to_i).to eq(item3.id)
    expect(merchants_items[:data].last[:id].to_i).to_not eq(item4.id)
  end
end
