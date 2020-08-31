require 'rails_helper'

describe "Items API" do
  it "index of items" do
    merch = create(:merchant)
    create_list(:item, 3, merchant: merch)

    get '/api/v1/items'
    expect(response).to be_successful
    items = JSON.parse(response.body)
    expect(items.size).to eq(3)
  end

  it "show page of item" do
    merch = create(:merchant)
    id = create(:item, merchant: merch).id

    get "/api/v1/items/#{id}"
    item = JSON.parse(response.body)
    expect(response).to be_successful
    expect(item["id"]).to eq(id)
  end

  it "create an item" do
    merch = create(:merchant)
    item_params = {name: "Quick Draw",
                   description: "Petzl, high quality draws",
                   unit_price: 7795,
                   merchant_id: merch.id}

    post '/api/v1/items', params: {item: item_params}
    item = Item.last
    expect(response).to be_successful
    expect(item.name).to eq(item_params[:name])
  end

  # it "update a record of an item" do
  #   merch = create(:merchant)
  #   id = create(:item, merchant: merch)
  #   previous_name = Item.last.name
  #   item_params = { name: "Quick Draw" }
  #
  #   put "/api/v1/items/#{id}", params: {item_params}
  #   item = Item.find_by(id: id)
  #
  #   expect(response).to be_successful
  #   expect(item.name).to_not eq(previous_name)
  #   expect(item.name).to eq("Quick Draws")
  # end
  #
  # it "destroy an item" do
  #   merch = create(:merchant)
  #   item = create(:item, merchant: merch)
  #
  #   expect{ delete "/api/v1/items/#{@item.id}" }.to change(Item, :count).by(-1)
  #   expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  # end
end
