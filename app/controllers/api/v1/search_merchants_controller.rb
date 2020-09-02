class Api::V1::SearchMerchantsController < ApplicationController
  def show
    search_result = MerchantSearchResults.new
    render json: MerchantSerializer.new(search_result.find_by_value(params[:name].downcase))
  end

  def index
    search_result = MerchantSearchResults.new
    result = render json: MerchantSerializer.new(search_result.find_all_by_value(params[:name].downcase))
  end
end
