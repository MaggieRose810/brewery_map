describe LocationCrawler do
  describe :call do
    subject { LocationCrawler.new }

    it 'creates breweries' do
      VCR.use_cassette("brewerydb-locations") do
        expect do
          subject.call
        end.to change { Brewery.count }.by(3)
      end
    end
    it 'finds breweries by ext_id' do
      create :brewery, ext_id: '9oltPu'
      VCR.use_cassette("brewerydb-locations") do
        expect do
          subject.call
        end.to change { Brewery.count }.by(2)
      end
    end
    it 'creates locations' do
      VCR.use_cassette("brewerydb-locations") do
        expect do
          subject.call
        end.to change { Location.count }.by(3)
      end
    end
    it 'finds locations by ext_id' do
      create :location, ext_id: 'OaZYgf'
      VCR.use_cassette("brewerydb-locations") do
        expect do
          subject.call
        end.to change { Location.count }.by(2)
      end
    end
  end
end
