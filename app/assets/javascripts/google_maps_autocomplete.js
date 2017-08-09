$(document).ready(function() {
  var event_event_address_street = $('#event_event_address_street').get(0);

  if (event_event_address_street) {
    var autocomplete = new google.maps.places.Autocomplete(event_event_address_street, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(event_event_address_street, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});

function onPlaceChanged() {
  var place = this.getPlace();
  var components = getAddressComponents(place);

  $('#event_event_address_street').trigger('blur').val(components.address);
  $('#event_event_address_postalcode').val(components.zip_code);
  $('#event_event_address_city').val(components.city);
}

function getAddressComponents(place) {
  // If you want lat/lng, you can look at:
  // - place.geometry.location.lat()
  // - place.geometry.location.lng()

  var street_number = null;
  var route = null;
  var zip_code = null;
  var city = null;
  var country_code = null;
  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {
      var type = component.types[j];
      if (type == 'street_number') {
        street_number = component.long_name;
      } else if (type == 'route') {
        route = component.long_name;
      } else if (type == 'postal_code') {
        zip_code = component.long_name;
      } else if (type == 'locality') {
        city = component.long_name;
      } else if (type == 'country') {
        country_code = component.short_name;
      }
    }
  }

  return {
    address: street_number == null ? route : (route + ' ' + street_number),
    zip_code: zip_code,
    city: city,
    country_code: country_code
  };
}
