import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
    const mapElement = document.getElementById('map');

    const fitMapToMarkers = (map, marker) => {
        const bounds = new mapboxgl.LngLatBounds();
        bounds.extend([ marker[1], marker[0] ]);
        map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
    };
  
    if (mapElement) { // only build a map if there's a div#map to inject into
        mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
        const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v10'
        });
        const marker = JSON.parse(mapElement.dataset.markers);
        console.log(marker)
            new mapboxgl.Marker()
            .setLngLat([ marker[1], marker[0] ])
            .addTo(map);
        fitMapToMarkers(map, marker);
    }
};




export { initMapbox };