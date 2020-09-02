class Api::V1::BusinessController < ApplicationController
  def most_revenue
    result = BusinessIntelligence.new
    render json: MerchantSerializer.new(result.most_revenue(params[:quantity]))
  end
end
