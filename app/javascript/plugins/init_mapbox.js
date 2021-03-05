import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
// import MapboxDirections from 'mapbox-gl-directions';

const api = 'pk.eyJ1Ijoic3VzYW5uYXBlenppbmkiLCJhIjoiY2trczlyYWRyMGNxMzJxcGJmOTZmY213byJ9.MKMDWkFyxS160hlxGSiT2g'

const url = `https://api.mapbox.com/directions/v5/mapbox/cycling/-84.518641,39.134270;-84.512023,39.102779?geometries=geojson&access_token=${api}`


const addMarkersToMap = (map, markers) => {
    markers.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this
        const el = document.createElement('div');
        el.classList.add('marker');

        new mapboxgl.Marker(el)
            .setLngLat([marker.lng, marker.lat])
            .setPopup(popup) // add this
            .addTo(map);
    });
};


const addCurrentLocation = (map) => {
	const geolocate = new mapboxgl.GeolocateControl({
    positionOptions: {
    	enableHighAccuracy: true
		},
		fitBoundsOptions: { // OPTIONAL
			padding: 1, // etc, see https://docs.mapbox.com/mapbox-gl-js/api/#map#fitbounds
			animate: false, // all AnimateOptions are supported
			zoom: 12, // all CameraOptions are supported
		},
		trackUserLocation: true,
		showAccuracyCircle: false
	})

	map.addControl(geolocate);
	map.on('load', function () {
			geolocate.trigger();
	});
}

const initMapbox = () => {
    const mapElement = document.getElementById('map');

    const fitMapToMarkers = (map, markers) => {
        const bounds = new mapboxgl.LngLatBounds();
        markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
        map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
    };

    if (mapElement) { // only build a map if there's a div#map to inject into
        mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
        const map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/mapbox/streets-v11'
        });

        const markers = JSON.parse(mapElement.dataset.markers);
        addMarkersToMap(map, markers)

        fitMapToMarkers(map, markers);

        map.addControl(new MapboxGeocoder({
            accessToken: mapboxgl.accessToken,
            mapboxgl: mapboxgl
        }));

			addCurrentLocation(map);
      map.scrollZoom.disable();

    }
};

export { initMapbox };









// import mapboxgl from 'mapbox-gl';
// import 'mapbox-gl/dist/mapbox-gl.css';
// import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

// const fitMapToMarkers = (map, markers) => {
//     const bounds = new mapboxgl.LngLatBounds();
//     markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
//     map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
// };

// const initMapbox = () => {
//     console.log("Hodor1")
//     const mapElement = document.getElementById('map');

//     if (mapElement) { // only build a map if there's a div#map to inject into
//         console.log("Hodor2")
//         mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
//         const map = new mapboxgl.Map({
//             container: 'map',
//             style: 'mapbox://styles/mapbox/streets-v11',
//             center: [-9.140, 38.730], // starting position
//             zoom: 13 // starting zoom


//         });
//         map.addControl(new MapboxGeocoder({
//             accessToken: mapboxgl.accessToken,
//             mapboxgl: mapboxgl
//         }));
//         debugger
//         const geolocate = new mapboxgl.GeolocateControl({
//             positionOptions: {
//                 enableHighAccuracy: true
//             },
//             fitBoundsOptions: { // OPTIONAL
//                 padding: 1, // etc, see https://docs.mapbox.com/mapbox-gl-js/api/#map#fitbounds
//                 animate: false, // all AnimateOptions are supported
//                 zoom: 12, // all CameraOptions are supported
//             },
//             trackUserLocation: true,
//             showAccuracyCircle: false
//         })

//         map.addControl(geolocate);
//         map.on('load', function () {
//             geolocate.trigger();
//         });

//         map.scrollZoom.disable();
//         const markers = JSON.parse(mapElement.dataset.markers);
//         markers.forEach((marker) => {
//             const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
//             const el = document.createElement('div');
//             el.classList.add('marker');
//             new mapboxgl.Marker(el)
//                 .setLngLat([marker.lng, marker.lat])
//                 .setPopup(popup)
//                 .addTo(map);
//         });
//         // fitMapToMarkers(map, markers);
//     }
// };

// export { initMapbox };