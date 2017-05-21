require 'rails_helper'

RSpec.describe Crawl, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:endpoint) }
  it { is_expected.to validate_inclusion_of(:endpoint).in_array(Crawl::ENDPOINTS)}

  describe "completed" do
    context "when completed_at is not set" do
      let (:crawl) { build :crawl, :uncompleted }
      it "sets completed to the current time" do
        Timecop.freeze(Date.today) do
          crawl.completed = 1
          expect(crawl.completed_at).to eql(Time.now)
        end
      end
    end

    context "when completed_at is set" do
      let (:original_time) { Time.zone.now.round }
      let (:crawl) { build :crawl, completed_at: original_time }
      it "does not modify existing completed_at time" do
        crawl.completed = 1
        expect(crawl.completed_at).to eql(original_time)
      end
      it "clears existing completed_at time" do
        crawl.completed = 0
        expect(crawl.completed_at).to eql(nil)
      end
    end
  end
end
