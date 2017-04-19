const loadLocations = (query) => {
  return axios.get(`/api/v1/locations?${query}`)
}

const loadBeers = (query) => {
  return axios.get(`/api/v1/beers?${query}`)
}