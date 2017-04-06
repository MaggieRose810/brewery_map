require 'rails_helper'

RSpec.describe Brewery, type: :model do
  subject{build :brewery }
  it { is_expected.to validate_presence_of(:ext_id) }
  it { is_expected.to validate_uniqueness_of(:ext_id) }
  it { is_expected.to have_many(:locations) }
end
