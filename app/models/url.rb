class Url < ApplicationRecord
  validates_presence_of :full_url
  validates :full_url, format: URI::regexp(%w[http https])
  validates_uniqueness_of :short_url

  scope :hundred_most_visited, -> { order('hit DESC').limit(100) }

  before_create :get_slug
  after_save :get_title

  def get_slug
    loop do
      self.short_url = rand(36**8).to_s(36)
    break unless Url.exists?(short_url: self.short_url)
    end
  end

  def get_title
    GetUrlTitleJob.perform_later self
  end
end
