$(function(){
  geocoder = new google.maps.Geocoder()
  let Address = document.getElementById('address').textContent;

  geocoder.geocode( { 'address': Address}, function(results, status) {
    if (status == 'OK') {
      map = new google.maps.Map(document.getElementById('map'), {
        zoom: 13
      });
      map.setCenter(results[0].geometry.location);
      const marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
    } else {
      document.getElementById('map').style.height = '14px'
      document.getElementById('map').innerHTML = '該当する場所が見つかりませんでした。'
    }
  });   
})