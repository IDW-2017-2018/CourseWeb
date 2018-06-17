        
    <div class="map-container">
        <div id="map" class="map-item"></div>
    </div>
    
     <noscript>

        <style type="text/css">
            .map-container {
                display: none;
            }
        </style>

        <div class="noscript-map-container">
            <div class="noscript-map-item">
                <img class="noscript-img" src="images/noscript-map.png">
            </div>
        </div>

    </noscript>


    <div class="about-text-box">
        
        <dir class="about-img-box">
            <img class="about-img" src="images/logo_imgs/logoDEF.png">
        </dir>
        
        <div class="about-text">
            <p>
            testo italiano testo italiano testo italiano <br><br>
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.
            </p>    
        </div>

    </div>


    <script>
        <!--
    
        function myMap() {
          var myCenter = new google.maps.LatLng(42.3689107,13.3494623);
          var mapCanvas = document.getElementById("map");
          var mapOptions = {center: myCenter, zoom: 12};
          var map = new google.maps.Map(mapCanvas, mapOptions);
          var marker = new google.maps.Marker({position:myCenter});
          marker.setMap(map);
        }

        //-->
    </script>
    
    <script src="https://maps.googleapis.com/maps/api/js?callback=myMap"></script>
