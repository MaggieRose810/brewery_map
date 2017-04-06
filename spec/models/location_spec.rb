require 'rails_helper'

RSpec.describe Location, type: :model do
  subject{ build :location }
  it { is_expected.to validate_presence_of(:ext_id) }
  it { is_expected.to validate_presence_of(:brewery_ext_id) }
  it { is_expected.to validate_uniqueness_of(:ext_id) }
end