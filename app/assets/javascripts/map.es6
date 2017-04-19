const initMap = () => {
  let position = {lat: 39.7392, lng: -104.9903};
  let map = new google.maps.Map(document.getElementById('map'), {
    zoom: 7,
    center: position
  });
  google.maps.event.addListener(map, 'idle', () => {
    loadLocations(buildQuery(map)).then( (response) => {
      addMarkers(response.data, map)
    })
    .catch( (error) => {
      console.error(error);
    });
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

const addMarkers = (locations, map) => {
  locations.forEach((item)=> {
    let position = {
        lat: parseFloat(item.location.lat),
        lng: parseFloat(item.location.lon)
      }
    let marker = new google.maps.Marker({
      position,
      map
    });
    buildInfoWindow(map, marker, item)
  })
}

const buildInfoWindow = (map, marker, location) => {
  var contentString = `
    <div itemscope itemtype="http://schema.org/LocalBusiness">
      <h2 class="brewery_name">${location.brewery.name}</h2>
      <a href="${location.website}" target="_blank">Website</a>
      <span itemprop="telephone">${location.phone || ''}</span>
      <p>${location.brewery.description || ''}</p>
  </div>`;

  var infowindow = new google.maps.InfoWindow({
    content: contentString
  });

  marker.addListener('click', function() {
    infowindow.open(map, marker);
    brewerySelected(location.brewery)
  });
}