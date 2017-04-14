const initMap = () => {
  let position = {lat: 39.7392, lng: -104.9903};
  let map = new google.maps.Map(document.getElementById('map'), {
    zoom: 13,
    center: position
  });
  loadLocations(map)
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
  axios.get('/api/v1/locations')
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

const addMarkers = (positions, map) => {
  positions.forEach((position)=> {
    new google.maps.Marker({
      position,
      map
    });
  })
}
