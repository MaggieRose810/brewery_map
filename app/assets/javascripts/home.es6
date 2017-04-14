const initMap = () => {
  let position = {lat: 39.7392, lng: -104.9903};
  let map = new google.maps.Map(document.getElementById('map'), {
    zoom: 7,
    center: position
  });
  google.maps.event.addListener(map, 'idle', () => {
    loadLocations(map)
  })
  getLocation(map)
}

const getLocation = (map) => {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition((position) => {
      map.setCenter({
        lat: position.coords.latitude,
        lng: position.coords.longitude
      })
    })
  }
}

const loadLocations = (map) => {
  axios.get(`/api/v1/locations?${buildQuery(map)}`)
  .then( (response) => {
    let positions = response.data.map((item) => {
      return {
        lat: parseFloat(item.location.lat),
        lng: parseFloat(item.location.lon)
      }
    })
    addMarkers(positions, map)
  })
  .catch( (error) => {
    console.error(error);
  });
}

const buildQuery = (map) => {
  let bounds = map.getBounds()
  let ne = bounds.getNorthEast()
  let sw = bounds.getSouthWest()

  return $.param({
    top_right: {
      lat: ne.lat(),
      lon: ne.lng()
    },
    bottom_left: {
      lat: sw.lat(),
      lon: sw.lng()
    }
  })
}

const addMarkers = (positions, map) => {
  positions.forEach((position)=> {
    new google.maps.Marker({
      position,
      map
    });
  })
}
