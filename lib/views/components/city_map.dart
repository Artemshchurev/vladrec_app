import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:vladrec_app/models/camera.dart';

class CityMap extends StatefulWidget {
  final Function selectCamera;
  final List<Camera> cameras;
  const CityMap({Key? key, required this.selectCamera, required this.cameras}) : super(key: key);

  @override
  _CityMapState createState() => _CityMapState();
}

class _CityMapState extends State<CityMap> {
  final MapController mapController = MapController();

  void _zoomIn() {
    mapController.move(mapController.center, mapController.zoom + 0.5);
  }

  void _zoomOut() {
    mapController.move(mapController.center, mapController.zoom - 0.5);
  }

  List<Marker> _getMarkers() {
    var markers = <Marker>[];
    widget.cameras.asMap().forEach((index, camera) {
      markers.add(Marker(
        width: 25,
        height: 25,
        point: LatLng(camera.lat, camera.lng),
        builder: (ctx) => GestureDetector(
          child: Image.asset('assets/components/map/marker.png'),
          onTap: () {
            widget.selectCamera(camera, index + 1);
          },
        ),
      ));
    });

    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 4,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 270,
        child: Stack(children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(43.118428, 131.903166),
              zoom: 12,
            ),
            mapController: mapController,
            layers: [
              TileLayerOptions(
                urlTemplate:
                'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
                tileProvider: NetworkTileProvider(),
              ),
              MarkerLayerOptions(markers: _getMarkers())
            ],
          ),
          Positioned(
              bottom: 25,
              right: 20,
              child: Column(
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.add,
                      color: Colors.red,
                      size: 40,
                    ),
                    onTap: _zoomIn,
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    child: const Icon(
                      Icons.remove,
                      color: Colors.red,
                      size: 40,
                    ),
                    onTap: _zoomOut,
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}
