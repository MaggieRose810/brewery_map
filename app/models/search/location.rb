class Search::Location < Elasticity::Document
  attr_accessor :id,
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
      :updated_at

  configure do |c|
    c.index_base_name = 'locations'
    c.document_type = 'location'
    c.mapping = {
      properties: {
        id: {type: 'string'},
        status: {type: 'string'},
        region: {type: 'string'},
        location: {type: 'geo_point'},
        name: {type: 'string'},
        ext_id: {type: 'string'},
        website: {type: 'string'},
        phone: {type: 'string'},
        location_type: {type: 'string'},
        postal_code: {type: 'string'},
        country_iso_code: {type: 'string'},
        brewery_ext_id: {type: 'string'},
        locality: {type: 'string'},
        street_address: {type: 'string'},
        created_at: {type: 'date'},
        updated_at: {type: 'date'}
      }
    }
  end

  def to_document
    {
      id: id,
      status: status,
      region: region,
      location: location,
      name: name,
      ext_id: ext_id,
      website: website,
      phone: phone,
      location_type: location_type,
      postal_code: postal_code,
      country_iso_code: country_iso_code,
      brewery_ext_id: brewery_ext_id,
      locality: locality,
      street_address: street_address,
      created_at: created_at,
      updated_at: updated_at
    }
  end

  def self.rebuild_documents(recreate: false, query:)
    recreate_index if recreate

    query.find_in_batches do |batch|
      documents = batch.map { |record| from_active_record(record) }
      bulk_index(documents)
    end
  end

  def self.from_active_record(record)
    attributes = record.attributes
    latitude = attributes.delete('latitude')
    longitude = attributes.delete('longitude')
    attributes[:location] = {
        lat: latitude,
        lon: longitude
    }
    new(attributes)
  end
end