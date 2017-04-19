const loadLocations = (query) => {
  return axios.get(`/api/v1/locations?${query}`)
}