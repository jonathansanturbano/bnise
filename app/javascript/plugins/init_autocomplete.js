import places from 'places.js';

const initAutocomplete = () => {

  const placesAutocomplete = places({
    container: document.getElementById('address-input'),
    templates: {
      value: function(suggestion) {
        return suggestion.name;
      }
    }
  }).configure({
    type: 'address',
    // Fill in with rest of countries list ASK BRANDON
    countries: ["at", "be", "bg", "ch", "cy", "cz", "de", "dk", "ee", "es", "fi", "fr", "gb", "gr", "ie", "it", "lt", "lu", "lv", "mt", "nl", "no", "pl", "pt", "ro", "se", "si"],
    language: 'en',
    aroundLatLngViaIP: false
  });

  placesAutocomplete.on('change', function resultSelected(e) {
    document.querySelector('#address2-input').value = e.suggestion.administrative || '';
    document.querySelector('#city-input').value = e.suggestion.city || '';
    document.querySelector('#postal-input').value = e.suggestion.postcode || '';
    document.querySelector('#country-input').value = e.suggestion.countryCode || '';
  });

  // const reconfigurableOptions = {
  //   language: 'en', // Receives results in German
  //   countries: ['fr'], // Search in the United States of America and in the Russian Federation
  //   aroundLatLngViaIP: false, // disable the extra search/boost around the source IP
  //   postcode: true
  // };
  // if (addressInput) {
  //   places({ container: addressInput }).configure(reconfigurableOptions);
  // }
};

export { initAutocomplete };
