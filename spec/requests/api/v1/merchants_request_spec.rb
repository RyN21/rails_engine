require 'rails_helper'

describe "Merchant API" do
  it "index of merchant" do
    create_list(:merchant, 4)

    get '/api/v1/merchants'
    expect(response).to be_successful
    merchants = JSON.parse(response.body)
    expect(merchants['data'].size).to eq(4)
  end

  it "show page of merchant" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"
    merchant = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant['data']['id'].to_i).to eq(id)
  end

  it "create an merchant" do
    merchant_params = {name: "Rock Gear"}

    post '/api/v1/merchants', params: {merchant: merchant_params}
    merchant = Merchant.last
    expect(response).to be_successful
    expect(merchant.name).to eq(merchant_params[:name])
  end

  it "update a record of an merchant" do
    id = create(:merchant).id
    previous_name = Merchant.last.name
    merchant_params   = { name: "Climbing Gear" }

    put "/api/v1/merchants/#{id}", params: {merchant: merchant_params}
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
  it "merchant's has items endpoints" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    item = create(:item, merchant: merchant)
    item = create(:item, merchant: merchant)
    item = create(:item, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_successful
    merchants_items = JSON.parse(response.body)
    expect(merchants_items.size).to eq(4)
  end
end
