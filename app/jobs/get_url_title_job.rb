class GetUrlTitleJob < ApplicationJob
  require 'open-uri'

  queue_as :default

  def perform(url)
    html = open(url.full_url)
    doc  = Nokogiri::HTML(html.read)
    
    url.update(title: doc.title)
  end
end
