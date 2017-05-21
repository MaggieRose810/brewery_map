require 'rails_helper'
describe 'Crawl Routes', type: :request do
  describe 'GET /admin/crawls/6' do
    let(:crawl) { create :crawl }
    it "renders the page" do
      get("/admin/crawls/#{crawl.id}")
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /admin/crawls/new' do
    it "renders the page" do
      get('/admin/crawls/new')
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /admin/crawls' do
    it "renders the page" do
      expect(CrawlLocationsJob).to receive(:perform_later)
      expect do
        post('/admin/crawls', params: {
          crawl: {
            name: 'Frodo',
            endpoint: 'locations'
          }
        })
      end.to change{ Crawl.count }.by(1)
      expect(response).to have_http_status(302)
    end
  end

  describe  'GET /admin/crawls/:id/edit' do
    let (:crawl) { create :crawl }
    it "renders the page" do
      get("/admin/crawls/#{crawl.id}/edit")
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH /admin/crawls/:id' do
    let!(:crawl) { create :crawl }
    it "renders the page" do
      expect do
        patch("/admin/crawls/#{crawl.id}", params: {
          crawl: {
            name: 'Frodo',
            endpoint: 'locations'
          }
        })
      end.not_to change{ Crawl.count }
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /admin/crawls' do
    let(:crawl) { create :crawl }
    it "renders the page" do
      get("/admin/crawls")
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /admin/crawls/:id' do
    let!(:crawl) { create :crawl }
    it "deletes the record" do
      expect do
        delete("/admin/crawls/#{crawl.id}")
      end.to change{ Crawl.count }.by(-1)
      expect(response).to have_http_status(302)
    end
  end
end
