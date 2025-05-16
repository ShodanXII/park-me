import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ParkingMapScreen extends StatelessWidget {
  // Your default parking location
  final LatLng parkingLocation = LatLng(37.7749, -122.4194); // Replace with your coordinates

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Parking Map')),
      body: FlutterMap(
        options: MapOptions(
          center: parkingLocation,
          zoom: 16.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: parkingLocation,
                builder: (ctx) => Icon(
                  Icons.local_parking,
                  color: Colors.blue,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
