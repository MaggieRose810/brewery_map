 class CrawlLocationsJob < ApplicationJob
  self.queue_adapter = :sidekiq

  def perform(crawl_id)
    crawler = LocationCrawler.new(page: 1)
    crawler.call
    Rails.logger.info "queueing #{crawler.number_of_pages} pages of location jobs"
    (2..crawler.number_of_pages).each do |page|
      LocationJob.perform_later(page, crawler.number_of_pages, crawl_id)
    end
  end
end
