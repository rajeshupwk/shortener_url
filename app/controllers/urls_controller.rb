class UrlsController < ApplicationController

  def new
    
  end

  def create
    @url           = Url.new(url_params)
    @url.short_url = get_slug
    @get_short_url = get_short_url
    @url.save
  end

  def shortener
    @url = Url.find_by(short_url: params[:slug])

    if @url.present?
      redirect_to @url.full_url
    else
      flash[:error] = 'page not found.'
      redirect_to root_url
    end
  end

  private

  def url_params
    params.require(:url).permit(:full_url)
  end

  def get_slug
    @get_slug ||= rand(36**8).to_s(36)
  end

  def get_short_url
    request.base_url + '/s/' + get_slug
  end
end
