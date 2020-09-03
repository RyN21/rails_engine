class Api::V1::SearchMerchantsController < ApplicationController
  def show
    result = MerchantSearchResults.new
    render json: MerchantSerializer.new(result.find_by_value(params[:name].downcase))
  end

  def index
    result = MerchantSearchResults.new
    render json: MerchantSerializer.new(result.find_all_by_value(params[:name].downcase))
  end
end
