import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:zeyarah/core/constants.dart';
import 'package:zeyarah/core/language_helper.dart';
import 'package:zeyarah/core/secrets.dart';
import 'package:zeyarah/features/trip_packages/data/model/package.dart';
import 'package:zeyarah/features/trip_tracker/data/model/landmark.dart';
import 'package:zeyarah/features/trip_tracker/presentation/widget/trip_tracking_detail_item.dart';

class Tracking extends StatefulWidget {
  const Tracking({super.key});

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  //data sent from prev. screen
  late Package pac;
  late List<LandMark> landMarks;
  late LatLng startPoint;

  //map data
  final Completer<GoogleMapController> controller = Completer();
  LocationData? currentLocation;
  List<LatLng> polyLineCoordinates = [];

  void getPolypoints(LatLng source, LatLng destination) async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      directionApi,
      PointLatLng(source.latitude, source.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polyLineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
      setState(() {});
    }
  }

  void getCurrentLocation() {
    Location location = Location();
    location.getLocation().then((location) {
      currentLocation = location;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pac = ModalRoute.of(context)!.settings.arguments as Package;
    landMarks = pac.listOfLandMarks;

    //getCurrentLocation();
    startPoint = landMarks.first.location;
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        Container(
          margin: const EdgeInsets.all(4),
          width: double.infinity,
          height: 400,
          child: GoogleMap(
            //map type
            mapType: MapType.normal,
            //the initial position to start the map at
            initialCameraPosition: CameraPosition(target: startPoint, zoom: 12),

            polylines: {
              Polyline(
                  polylineId: const PolylineId("route"),
                  points: polyLineCoordinates,
                  color: specialColor,
                  width: 3),
            },
            onMapCreated: (controller) {
              print('map created');
              getPolypoints(landMarks.first.location, landMarks.last.location);
            },

            //the set of markers will be visible in the map
            markers: landMarks.map((e) {
              return Marker(
                  markerId: MarkerId(e.name),
                  position: e.location,
                  infoWindow: InfoWindow(
                    title: e.name,
                    snippet: e.name,
                  ),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueBlue));
            }).toSet(),
          ),
        ),
        const TimerContainer(),
        Expanded(
          child: Container(
              padding: const EdgeInsets.all(6),
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20)),
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(context.loc.tripTracking,
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  ...landMarks
                      .map((e) => TripTrackingDetailItem(
                            name: e.name,
                            time: e.time,
                          ))
                      .toList()
                ],
              )),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/trip_details');
              //Get.offAllNamed('/trip_details');
            },
            child: Text(context.loc.closeTrip))
      ])),
    );
  }
}

class TimerContainer extends StatefulWidget {
  const TimerContainer({Key? key}) : super(key: key);

  @override
  State<TimerContainer> createState() => _TimerContainerState();
}

class _TimerContainerState extends State<TimerContainer> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20)),
      height: 50,
      width: double.infinity,
      //color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TimeCard(
              time: '00',
              header: 'HOURS'),
          const SizedBox(
            width: 8,
          ),
          TimeCard(
              time: '00',
              header: 'MINUTES'),
          const SizedBox(
            width: 8,
          ),
          TimeCard(
              time: '00',
              header: 'SECONDS'),
        ],
      ),
    );
  }


}

class TimeCard extends StatelessWidget {
  final String time;
  final String header;
  const TimeCard({super.key, required this.time, required this.header});

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                time,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              header,
              style: const TextStyle(color: Colors.black, fontSize: 10),
            )
          ],
        );


  }
}
