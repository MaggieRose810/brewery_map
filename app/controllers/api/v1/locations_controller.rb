class Api::V1::LocationsController < ApplicationController
  def index
    @locations = Location.geocoded.limit(50).includes(:brewery)
  end
end
