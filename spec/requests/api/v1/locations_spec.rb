require 'rails_helper'

describe 'Locations API', type: :request do
  describe 'GET /api/v1/locations' do

    it 'returns locations' do
      create_list :location, 2, latitude: 1, longitude: 1
      get '/api/v1/locations'
      locations = JSON.parse(response.body)
      expect(locations.length).to eql(2)
      expect(response).to have_http_status(200)
    end

    it 'excludes locations that are not geocoded' do
      create :location, latitude: nil, longitude: nil
      get '/api/v1/locations'
      locations = JSON.parse(response.body)
      expect(locations.length).to eql(0)
      expect(response).to have_http_status(200)
    end
  end
end