require 'rails_helper'

RSpec.describe Crawl, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:endpoint) }
  it { is_expected.to validate_inclusion_of(:endpoint).in_array(Crawl::ENDPOINTS)}
end
