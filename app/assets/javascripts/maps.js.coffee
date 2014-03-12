$ ->
  $('.drive-location-address').each ->
    location = $(this).val()

    map = GMaps({
      div: '#drive_location-' + $(this).data('drive-location-id'),
      lat: -12.043333,
      lng: -77.028333
    })

    GMaps.geocode({
      address: location,
      callback: (results, status) ->
        if (status == 'OK')
          latlng = results[0].geometry.location;
          map.setCenter(latlng.lat(), latlng.lng());
          map.addMarker({
            lat: latlng.lat(),
            lng: latlng.lng()
          });
    });
