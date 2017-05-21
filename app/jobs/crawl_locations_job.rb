 class CrawlLocationsJob < ApplicationJob
  self.queue_adapter = :sidekiq

  def perform
    crawler = LocationCrawler.new(page: 1)
    crawler.call
    Rails.logger.info "queueing #{crawler.number_of_pages} pages of location jobs"
    (2..crawler.number_of_pages).each do |page|
      LocationJob.perform_later(page)
    end
  end
end
