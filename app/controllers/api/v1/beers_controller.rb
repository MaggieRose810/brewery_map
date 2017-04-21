class Api::V1::BeersController < ApplicationController

  def index
    @beers = Brewerydb::Brewery.beers(params[:brewery_ext_id]).sort do |a, b|
     b.create_date <=> a.create_date
   end
    render(json: @beers)
  end

end