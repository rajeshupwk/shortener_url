module UrlsHelper
  def get_short_url(short_url)
    request.base_url + '/s/' + short_url
  end
end
