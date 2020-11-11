class Url < ApplicationRecord
  validates_presence_of :full_url
  validates :full_url, format: URI::regexp(%w[http https])
  validates_uniqueness_of :short_url

  after_save :get_title

  def get_title
    GetUrlTitleJob.perform_later self
  end
end
