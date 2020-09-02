class Api::V1::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all)
  end

  def show
    if params[:item_id]
      merchant_id = Item.find(params[:item_id]).merchant_id
      render json: MerchantSerializer.new(Merchant.find(merchant_id))
    else
      render json: MerchantSerializer.new(Merchant.find(params[:id]))
    end
  end

  def create
    render json: MerchantSerializer.new(Merchant.create(merchant_params))
  end

  def update
    render json: MerchantSerializer.new(Merchant.update(params[:id], merchant_params))
  end

  def destroy
    Merchant.destroy(params[:id])
  end

  private
  def merchant_params
    params.permit(:name)
  end
end
