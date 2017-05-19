class Admin::CrawlsController < ApplicationController
  http_basic_authenticate_with(
    name: ENV["SIDEKIQ_USERNAME"],
    password: ENV["SIDEKIQ_PASSWORD"],
    except: :index) if Rails.env.production?

  def new
    @crawl = Crawl.new
  end

  def create
    @crawl = Crawl.new(crawl_params)
    if @crawl.save
      redirect_to admin_crawl_path(@crawl)
    else
      render 'new'
    end
  end

  def edit
    @crawl = Crawl.find(params[:id])
  end

  def update
    @crawl = Crawl.find(params[:id])
    if @crawl.update_attributes(crawl_params)
      redirect_to admin_crawl_path(@crawl)
    else
      render 'edit'
    end
  end

  def show
    @crawl = Crawl.find(params[:id])
  end

  def index
     @unprocessed_crawls = Crawl.processing.limit(25)
     @completed_crawls = Crawl.completed
  end

  def destroy
    @crawl = Crawl.find(params[:id])
    @crawl.destroy
    redirect_to admin_crawls_path
  end

  private
  def crawl_params
    params.require(:crawl).permit(:name, :endpoint)
  end
end
