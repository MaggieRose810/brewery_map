class Api::V1::BeersController < ApplicationController

  def index
    @beers = Brewerydb::Brewery.beers(params[:brewery_ext_id]).sort do |a, b|
     b.create_date <=> a.create_date
    end
    beers_ids = @beers.map(&:id)
    @likes = Like.where(beer_ext_id: beers_ids).
                  group(:beer_ext_id, :positive).
                  count
  end
end