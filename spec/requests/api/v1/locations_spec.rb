require 'rails_helper'

describe 'Locations API', type: :request do
  describe 'GET /api/v1/locations' do

    before do
      create_list :location, 2
    end

    it 'returns locations' do
      get '/api/v1/locations'
      locations = JSON.parse(response.body)
      expect(locations.length).to eql(2)
      expect(response).to have_http_status(200)
    end
  end
end