class LocationJob < ApplicationJob
  self.queue_adapter = :sidekiq

  def perform(page)
    crawler = LocationCrawler.new(page: page)
    crawler.call
  end
end
