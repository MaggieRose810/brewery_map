module Admin::CrawlsHelper
  def endpoint_options
    Crawl::ENDPOINTS.map do |e|
      [e.capitalize, e]
    end
  end
end