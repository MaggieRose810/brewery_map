class LocationJob < ApplicationJob
  self.queue_adapter = :sidekiq

  def perform(page, last_page, crawl_id)
    crawler = LocationCrawler.new(page: page)
    crawler.call
    if page == last_page && crawl_id
      crawl = Crawl.find(crawl_id)
      crawl.update_attributes(completed_at: Time.now)
      new_records = Location.created_between(crawl.created_at, crawl.completed_at)
      Search::Location.rebuild_documents(query: new_records)
    end
  end
end
