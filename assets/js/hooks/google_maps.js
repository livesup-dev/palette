import { getAttributeOrThrow } from "../lib/attribute";

export default {
  mounted() {
    this.map = new google.maps.Map(document.getElementById("map"), {
        center: {
            lat: 45.4628328,
            lng: 9.1076926
        },
        zoom: 2,
        disableDefaultUI: true,
        mapTypeControl: true,
        scaleControl: true,
        zoomControl: true,
        zoomControlOptions: {
            style: google.maps.ZoomControlStyle.LARGE 
        }
    });

    this.props = getProps(this);

    this.handleEvent(`googlemap:${this.props.id}:locations`, ({ locations }) => {
        var map = this.map
            locations.forEach(function (location, i) {
                var markerPosition = { lat: parseFloat(location.latitude), lng: parseFloat(location.longitude) }
                const mapMarker = new google.maps.Marker({
                    position: markerPosition,
                    animation: google.maps.Animation.DROP,
                })

                const infowindow = new google.maps.InfoWindow({
                    content: location.content,
                  });
                mapMarker.addListener("click", () => {
                    infowindow.open(map, mapMarker);
                    });
                    
                mapMarker.setMap(map);
            });
        });
    }
}

function getProps(hook) {
    return {
        id: getAttributeOrThrow(hook.el, "data-id"),
    };
}