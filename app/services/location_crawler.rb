class LocationCrawler

  def call
    locations.each do|location|
      brewery = Brewery.find_or_initialize_by(ext_id: location.brewery.id) do |b|
        b.update_attributes(
          is_organic: location.brewery.is_organic,
          website: location.brewery.website,
          status: location.brewery.status,
          description: location.brewery.description,
          status_display: location.brewery.status_display,
          name: location.brewery.name
        )
      end

      Location.find_or_initialize_by(ext_id: location.id) do |l|
        l.update_attributes(
          status: location.status,
          region: location.region,
          latitude: location.latitude,
          name: location.name,
          website: location.website,
          longitude: location.longitude,
          phone: location.phone,
          location_type: location.location_type,
          postal_code: location.postal_code,
          country_iso_code: location.country_iso_code,
          brewery: brewery,
          locality: location.locality,
          street_address: location.street_address
        )
      end
    end
  end

  private

  def locations
    @locations ||= Brewerydb::Location.index
  end
end