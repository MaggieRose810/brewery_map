class Api::V1::BeersController < ApplicationController

  def index
    @beers = Brewerydb::Brewery.beers(params[:brewery_ext_id])
    render(json: @beers.items)
  end

end