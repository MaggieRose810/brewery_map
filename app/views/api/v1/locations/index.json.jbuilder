json.array! @locations do |location|
    json.extract!(location,   :id,
  :status,
  :region,
  :location,
  :name,
  :ext_id,
  :website,
  :phone,
  :location_type,
  :postal_code,
  :country_iso_code,
  :brewery_ext_id,
  :locality,
  :street_address,
  :created_at,
  :updated_at)
    json.brewery(@breweries[location.brewery_ext_id])
  end
