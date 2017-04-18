class Api::V1::LocationsController < ApplicationController
  def index
    @locations = Search::Location.geo_search(search_params)
    brewery_ids = @locations.map(&:brewery_ext_id)
    @breweries = Brewery.where(ext_id: brewery_ids).index_by(&:ext_id)
  end

  private

  def search_params
    {
      top_right: top_right,
      bottom_left: bottom_left
    }
  end

  def top_right
    if params[:top_right]
      params[:top_right].permit(:lat, :lon).to_h
    else
      {
        lat: 46.595327,
        lon: -68.400200
      }
    end
  end

  def bottom_left
    if params[:bottom_left]
       params[:bottom_left].permit(:lat, :lon).to_h
    else
      {
        lat: 25.252938,
        lon: -127.462699
      }
    end
  end
end
