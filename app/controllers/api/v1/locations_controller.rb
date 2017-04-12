class Api::V1::LocationsController < ApplicationController
  def index
    @locations = Location.limit(50)
    render json: @locations
  end
end
