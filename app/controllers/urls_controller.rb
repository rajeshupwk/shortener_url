class UrlsController < ApplicationController

  def index
    @urls = Url.hundred_most_visited
  end

  def new
    @url = Url.new
  end

  def create
    @url           = Url.new(url_params)
    @url.short_url = get_slug
    if @url.save
      @get_short_url = get_short_url
    end
  end

  def shortener
    @url = Url.find_by(short_url: params[:slug])

    if @url.present?
      @url.update(hit: @url.hit + 1)
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
