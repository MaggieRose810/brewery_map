class Api::V1::LocationsController < ApplicationController
  def index
    @locations = Search::Location.geo_search(search_params)
  end

  private

  def search_params
    {
      top_right: params[:top_right].permit(:lat, :lon).to_h,
      bottom_left: params[:bottom_left].permit(:lat, :lon).to_h
    }
  end
end
