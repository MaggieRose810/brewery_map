require 'rails_helper'

RSpec.describe Like, type: :model do
  it { is_expected.to validate_presence_of(:user_uuid) }
  it { is_expected.to validate_presence_of(:beer_ext_id) }
end
