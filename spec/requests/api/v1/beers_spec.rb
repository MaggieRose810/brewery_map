require 'rails_helper'
describe 'Beers API', type: :request do
  describe 'Index' do
    it 'returns beers' do
      VCR.use_cassette("brewerydb-beers") do
        get('/api/v1/beers', params: {brewery_ext_id: 'sJqs5o'})
      end
      expect(response).to have_http_status(200)
      beers = JSON.parse(response.body)
      expect(beers.length).to eql(2)
    end
  end
end