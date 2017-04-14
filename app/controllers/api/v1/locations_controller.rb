class Api::V1::LocationsController < ApplicationController
  def index
    @locations = Search::Location.search({})
  end
end
