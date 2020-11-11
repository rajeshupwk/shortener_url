class UrlsController < ApplicationController

  def new
    
  end

  def create
    @url = Url.new(url_params)

    @url.save
    redirect_to @url
  end

  private

  def url_params
    params.require(:url).permit(:full_url)
  end
end
