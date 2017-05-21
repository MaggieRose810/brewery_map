namespace :brewerydb do
  desc "Crawl the brewerydb locations api"
  task import_locations: :environment do
    CrawlLocationsJob.perform_later(nil)
  end
end
