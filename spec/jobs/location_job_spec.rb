require 'rails_helper'

describe LocationJob do
  describe "perform" do
    let(:crawl) { create :crawl, :uncompleted }
    let(:last_page) { 2 }
    subject { LocationJob.new }
    before do
      allow_any_instance_of(LocationCrawler).to receive(:call)
    end
    context "when on the last page" do
      let(:page) { 2 }
      it "updates the completed_at and reindexes documents in elastic search" do
        expect(Search::Location).to receive(:rebuild_documents)
        subject.perform(page, last_page, crawl.id)
        crawl.reload
        expect(crawl).to be_completed
      end
    end
    context "when not on the last page" do
      let(:page) { 1 }
      it "does not update completed_at or reindex" do
        expect(Search::Location).not_to receive(:rebuild_documents)
        subject.perform(page, last_page, crawl.id)
        crawl.reload
        expect(crawl).not_to be_completed
      end
    end
  end
end