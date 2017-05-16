require 'rails_helper'

describe 'Likes API', type: :request do
  describe 'Create' do
    it 'creates a like' do
      expect {
        post('/api/v1/likes', params: { like: {
          positive: false,
          user_uuid: 123,
          beer_ext_id: 456
          }
        })
      }.to change{ Like.count }.by(1)
      expect(response).to have_http_status(201)
    end
    it 'does not create a like with invalid parameters' do
      expect {
        post('/api/v1/likes', params: { like: {
          user_uuid: 123,
          beer_ext_id: 456
          }
        })
      }.not_to change{ Like.count }
      expect(response).to have_http_status(422)
    end
  end
end
