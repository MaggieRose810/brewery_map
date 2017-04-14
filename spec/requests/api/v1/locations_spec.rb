require 'rails_helper'

describe 'Locations API', type: :request do
  describe 'GET /api/v1/locations' do

    it 'returns locations' do
      create_list :location, 2, latitude: 1, longitude: 1
      Search::Location.rebuild_documents(recreate: true, query: Location.all)
      Elasticity.config.client.index_flush
      get '/api/v1/locations', params: {
        top_right: { lat:2, lon: 2 },
        bottom_left: { lat: 0, lon: 0 }
      }
      locations = JSON.parse(response.body)
      expect(locations.length).to eql(2)
      expect(response).to have_http_status(200)
    end

    it 'excludes locations that are not geocoded' do
      create :location, latitude: nil, longitude: nil
      Search::Location.rebuild_documents(recreate: true, query: Location.all)
      Elasticity.config.client.index_flush
      get '/api/v1/locations', params: {
        top_right: { lat:2, lon: 2 },
        bottom_left: { lat: 0, lon: 0 }
      }
      locations = JSON.parse(response.body)
      expect(locations.length).to eql(0)
      expect(response).to have_http_status(200)
    end
  end
end