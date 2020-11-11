require 'rails_helper'

RSpec.describe Url, type: :model do
  it "is valid with valid attributes" do
    full_url = Faker::Internet.url
    url = Url.new(full_url: full_url)
    expect(url).to be_valid
  end

  it "is not valid without a full_url" do
    url = Url.new(full_url: nil)
    expect(url).to_not be_valid
  end

  it "is not valid without http in a full_url" do
    url = Url.new(full_url: "xyz.com")
    expect(url).to_not be_valid
  end

  it "is not valid with repeated short_url" do
    full_url = Faker::Internet.url
    url_1 = Url.new(full_url: full_url, short_url: 'same_url')
    url_2 = Url.new(full_url: full_url, short_url: 'same_url')
    expect(url_2).to be_valid
  end
end
