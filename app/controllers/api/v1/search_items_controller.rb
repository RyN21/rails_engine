class Api::V1::SearchItemsController < ApplicationController
  def show
    search_result = ItemSearchResults.new
    render json: ItemSerializer.new(search_result.find_by_value(params[:attribute].downcase))
  end

  def index
    search_result = ItemSearchResults.new
    render json: ItemSerializer.new(search_result.find_all_by_value(params[:attribute].downcase))
  end
end
