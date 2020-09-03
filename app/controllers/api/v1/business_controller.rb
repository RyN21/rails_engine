class Api::V1::BusinessController < ApplicationController
  def most_revenue
    result = BusinessIntelligence.new
    render json: MerchantSerializer.new(result.most_revenue(params[:quantity]))
  end

  def most_items
    result = BusinessIntelligence.new
    render json: MerchantSerializer.new(result.most_items(params[:quantity]))
  end

  def merchant_revenue
    result = BusinessIntelligence.new
    render json: MerchantSerializer.new(result.merchant_rev(params[:id]))
  end
end
