window.addEventListener("load", () => {
  const inputAddress = document.getElementById('address').textContent;
  const target = document.getElementById('map');
  geocoder = new google.maps.Geocoder();

  geocoder.geocode( { address: inputAddress}, (results, status) => {
    if (status == 'OK') {
      const map = new google.maps.Map(target, {
        center: results[0].geometry.location,
        zoom: 13
      });
      new google.maps.Marker({
        map: map,
        position: results[0].geometry.location,
      });
    } else {
      document.getElementById('map').style.height = '20px'
      document.getElementById('map').innerHTML = '該当する場所が見つかりませんでした。'
    }
  });   
})