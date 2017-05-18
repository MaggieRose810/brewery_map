json.array! @beers do |beer|
  json.extract!(beer,   :id,
    :name,
    :name_display,
    :style_id,
    :is_organic,
    :status,
    :status_display,
    :create_date,
    :update_date,
    :style,
    :like_count,
    :dislike_count)
      json.like_count @likes[[beer.id, true]] || 0
      json.dislike_count @likes[[beer.id, false ]] || 0
end