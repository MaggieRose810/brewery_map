namespace :brewerydb do
  desc "Crawl the brewerydb locations api"
  task import_locations: :environment do
    crawler = LocationCrawler.new(page: 1)
    crawler.call
    Rails.logger.info "queueing #{crawler.number_of_pages} pages of location jobs"
    (2..crawler.number_of_pages).each do |page|
      LocationJob.perform_later(page)
    end
  end
end
