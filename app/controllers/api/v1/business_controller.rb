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
    result.merchant_rev(params[:id]).to_json
    parsed_result = JSON.parse(result.merchant_rev(params[:id]).to_json)
    render json: RevenueSerializer.handroll(parsed_result)
  end

  def dates_revenue
    result = BusinessIntelligence.new
    parsed_result = JSON.parse(result.revenue_between_dates(params[:start], params[:end]).to_json)
    render json: RevenueSerializer.handroll(parsed_result)
  end
end
