import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

// ctrl + f and then '//.*'
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Live Tracking',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double lat = 0.0;
  double lng = 0.0;
  BitmapDescriptor? carIcon;
  List<Polyline> polylines = <Polyline>[];
  List<Marker> places = <Marker>[
    // const Marker(
    //   markerId: MarkerId('1'),
    //   position: LatLng(38.4393, 27.2064),
    //   infoWindow: InfoWindow(title: 'RBHome', snippet: 'Home'),
    // ),
    // const Marker(
    //   markerId: MarkerId('2'),
    //   position: LatLng(38.3829, 27.1466),
    //   infoWindow: InfoWindow(title: 'GKHome', snippet: 'Home'),
    // ),
    // const Marker(
    //   markerId: MarkerId('3'),
    //   position: LatLng(38.4218, 27.1308),
    //   infoWindow: InfoWindow(title: 'Egegen', snippet: 'Work'),
    // ),
  ];

  iconMaker(context) {
    ImageConfiguration config = createLocalImageConfiguration(context);
    BitmapDescriptor.fromAssetImage(
      config,
      'assets/car.png',
    ).then((icon) => {carIcon = icon});
  }

  // var openedLocation;

  Future<void> getMyLocation() async {
    GoogleMapController controller = await mapControl.future;
    if (await Geolocator.checkPermission() == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best); //ios ~0m android 0-100m for best accuracy
    var userPlace = Marker(
        markerId: MarkerId('1'),
        position: LatLng(location.latitude, location.longitude),
        infoWindow: InfoWindow(title: 'UserLoc', snippet: '@username'),
    );
    setState(() {
      places.add(userPlace);
      lat = location.latitude;
      lng = location.longitude;
    });
    var goPlace = CameraPosition(target: LatLng(lat, lng), zoom: 11.5);
    controller.animateCamera(CameraUpdate.newCameraPosition(goPlace));
  }

  Future<void> driverLocation() async {
    GoogleMapController controller = await mapControl.future;
    var goPlace = CameraPosition(target: LatLng(egegen.latitude, egegen.longitude), zoom: 11.5);
    var goingPlace = Marker(
        markerId: MarkerId('3'),
        position: LatLng(egegen.latitude, egegen.longitude),
        infoWindow: InfoWindow(title: 'DriverLoc', snippet: '@drivername'),
        icon: carIcon!
      );
    setState(() {
      places.add(goingPlace);
    });
    controller.animateCamera(CameraUpdate.newCameraPosition(goPlace));
  }

  // Future<List<LatLng>> getRouteCoordinates(double startLat, double startLng, double endLat, double endLng) async {
  //   String apiUrl = 'https://maps.googleapis.com/maps/api/directions/json?origin=$startLat,$startLng&destination=$endLat,$endLng&key=$apiKey';
  //   final response = await http.get(Uri.parse(apiUrl));
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> data = json.decode(response.body);
  //     List<LatLng> coordinates = [];
  //     var startLatitude = startLat;
  //     var startLongitude = startLng;
  //     if (data['status'] == 'OK') {
  //       List steps = data['routes'][0]['legs'][0]['steps'];
  //       // debugPrint(steps[0]['legs'][0]['steps'].toString());
  //       // debugPrint(steps[0]['overview_polyline'].toString());
  //       for (var step in steps) {
  //         coordinates.add(LatLng(
  //           step['start_location']['lat'],
  //           step['start_location']['lng'],
  //         ));
  //         if(coordinates.contains(
  //             LatLng(
  //           step['start_location']['lat'],
  //           step['start_location']['lng']))){
  //           coordinates.add(LatLng(
  //             step['end_location']['lat'],
  //             step['end_location']['lng'],
  //           ));
  //         }
  //       }
  //     }
  //
  //     // if (data['status'] == 'OK') {
  //     //   String overviewPolylineString  = data['routes'][0]['overview_polyline']['points'];
  //     //   if (data['routes'].isNotEmpty) {
  //     //     List<LatLng> overviewPolyline = decodePolyline(overviewPolylineString);
  //     //     for(var point in overviewPolyline){
  //     //       startLatitude += point.latitude;
  //     //       startLongitude += point.longitude;
  //     //       debugPrint(startLatitude.toString()+' '+startLongitude.toString());
  //     //       coordinates.add(LatLng(startLatitude, startLongitude));
  //     //     }
  //     //     // coordinates.addAll(overviewPolyline);
  //     //   } else {
  //     //     debugPrint('No driving route found.');
  //     //   }
  //     // }
  //     return coordinates;
  //   } else {
  //     throw Exception('Failed to load route');
  //   }
  // }
  //
  // Future<void> makeRoute() async {
  //   GoogleMapController controller = await mapControl.future;
  //   // LatLng home = LatLng(38.4393, 27.1308);
  //   // LatLng drive = LatLng(38.4218, 27.2064);
  //   // Calculate the bounds
  //   LatLng route = LatLng((38.4393+38.4218)/2, (27.1308+27.2064)/2);
  //
  //   List<LatLng> routeCoordinates = await getRouteCoordinates(38.4218, 27.1308, 38.4393, 27.2064);
  //
  //   Polyline routePolyline = Polyline(
  //     polylineId: const PolylineId('5'),
  //     width: 3,
  //     color: Colors.blue,
  //     points: routeCoordinates, // Update the points property with the fetched coordinates
  //   );
  //
  //   setState(() {
  //     debugPrint(polylines.length.toString());
  //     polylines.add(routePolyline);
  //     debugPrint(polylines.length.toString());
  //   });
  //   controller.animateCamera(CameraUpdate.newLatLngZoom(route, 12.5));
  //   // controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 10));
  // }

  Future<List<LatLng>> getRouteCoordinates(double startLat, double startLng, double endLat, double endLng) async {
    String apiUrl = 'https://maps.googleapis.com/maps/api/directions/json?origin=$startLat,$startLng&destination=$endLat,$endLng&key=$apiKey';
    var startLatitude = startLat;
    var startLongitude = startLng;
    List<LatLng> coordinates = [];
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      if (data['status'] == 'OK') {
        String overviewPolylineString = data['routes'][0]['overview_polyline']['points'];
        // debugPrint(data['routes'][0]['overview_polyline'].toString());
        List<LatLng> overviewPolyline = decodePolyline(overviewPolylineString);
        // debugPrint(overviewPolyline.toString());
        // debugPrint(overviewPolyline[0].latitude.toString() + ' '+overviewPolyline[0].longitude.toString());
        coordinates.addAll(overviewPolyline);

        // If you want to add the start and end points to the route, you can uncomment these lines
        // coordinates.add(LatLng(startLat, startLng));
        // coordinates.add(LatLng(endLat, endLng));
      }
      return coordinates;
    }
    return coordinates;
  }
  LatLng home = LatLng(38.4393, 27.2064);
  LatLng egegen = LatLng(38.4218, 27.1308);
  LatLng diff = LatLng(38.3675, 26.8305);
  Future<void> makeRoute() async {
    GoogleMapController controller = await mapControl.future;
    LatLng route = LatLng((home.latitude+diff.latitude)/2, (home.longitude+diff.longitude)/2);
    double distance = distanceBetween(home, diff);
    debugPrint('distance: '+distance.toString());
    double zoom = 12.5;
    if (distance > 100) {
      zoom = 6;
    } else if (distance > 50) {
      zoom = 8;
    } else if (distance > 25) {
      zoom = 10;
    }
    List<LatLng> routeCoordinates = await getRouteCoordinates(diff.latitude, diff.longitude, home.latitude,home.longitude);

    Polyline routePolyline = Polyline(
      polylineId: const PolylineId('5'),
      width: 3,
      color: Colors.blue,
      points: routeCoordinates, // Update the points property with the fetched coordinates
    );

    setState(() {
      debugPrint(polylines.length.toString());
      polylines.add(routePolyline);
      debugPrint(polylines.length.toString());
    });
    controller.animateCamera(CameraUpdate.newLatLngZoom(route, zoom));
    // controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 10));
  }

  // @override
  // void initState() async {
  //   super.initState();
  //   getLocation(); // Call getLocation() to set lat and lng
  //   openedLocation = CameraPosition(target: LatLng(lat, lng));
  // }

  Completer<GoogleMapController> mapControl = Completer();
  var openedLocation =
      const CameraPosition(target: LatLng(38.4392077, 27.2064136), zoom: 10);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    iconMaker(context);
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //   foregroundColor: Theme.of(context).colorScheme.background,
        //   centerTitle: true,
        //   title: Text('Live Tracking App'),
        // ),
        body: Center(
      child: Column(
        children: [
          SizedBox(
            width: width,
            height: height * .6,
            child:
            GoogleMap(
              initialCameraPosition: openedLocation,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                mapControl.complete(controller);
              },
              myLocationButtonEnabled: false,
              trafficEnabled: false,
              polylines:Set<Polyline>.of(polylines),
              markers: Set<Marker>.of(places),
              // trafficEnabled: true,
            ),
          ),
          SizedBox(
            height: height * .05,
          ),
          Text('Latitude: $lat'),
          Text('Longitude: $lng'),
          ElevatedButton(
              onPressed: () {
                getMyLocation();
              },
              child: Text('Get My Location Info')),
          SizedBox(
            height: height * .05,
          ),
          ElevatedButton(
              onPressed: () {
                driverLocation();
              },
              child: Text('Driver Location')),
          SizedBox(
            height: height * .05,
          ),
          ElevatedButton(
              onPressed: () {
                makeRoute();
              },
              child: Text('Make Route'))
        ],
      ),
    ));
  }

  // List<LatLng> decodePolyline(String polylineString) {
  //   List<LatLng> decodedPoints = [];
  //   int index = 0;
  //   int lat = 0;
  //   int lng = 0;
  //   bool negativeLatitude = false;
  //   bool negativeLongitude = false;
  //
  //   while (index < polylineString.length) {
  //     if (index >= polylineString.length) {
  //       break; // Prevent out-of-bounds access
  //     }
  //
  //     int shift = 0;
  //     int result = 0;
  //
  //     do {
  //       if (index >= polylineString.length) {
  //         break; // Prevent out-of-bounds access
  //       }
  //
  //       result = polylineString.codeUnitAt(index) - 63;
  //       index++;
  //       negativeLatitude = (result & 0x20) != 0;
  //       result &= 0x1F;
  //       shift += 5;
  //     } while (result >= 32);
  //
  //     if (negativeLatitude) {
  //       lat -= (1 << shift);
  //     } else {
  //       lat += (1 << shift);
  //     }
  //
  //     shift = 0;
  //     result = 0;
  //
  //     do {
  //       if (index >= polylineString.length) {
  //         break; // Prevent out-of-bounds access
  //       }
  //
  //       result = polylineString.codeUnitAt(index) - 63;
  //       index++;
  //       negativeLongitude = (result & 0x20) != 0;
  //       result &= 0x1F;
  //       shift += 5;
  //     } while (result >= 32);
  //
  //     if (negativeLongitude) {
  //       lng -= (1 << shift);
  //     } else {
  //       lng += (1 << shift);
  //     }
  //
  //     decodedPoints.add(LatLng(lat / 1E5, lng / 1E5));
  //   }
  //
  //   return decodedPoints;
  // }

  List<LatLng> decodePolyline(String polylineString) {
    List<LatLng> decodedPoints = [];
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> encodedPoints = polylinePoints.decodePolyline(polylineString);

    for (PointLatLng encodedPoint in encodedPoints) {
      LatLng decodedPoint = LatLng(encodedPoint.latitude, encodedPoint.longitude);
      decodedPoints.add(decodedPoint);
    }
    return decodedPoints;
  }

  double distanceBetween(LatLng p1, LatLng p2) {
    double earthRadius = 6371.01;
    double lat1Rad = p1.latitude * (pi / 180);
    double lon1Rad = p1.longitude * (pi / 180);
    double lat2Rad = p2.latitude * (pi / 180);
    double lon2Rad = p2.longitude * (pi / 180);

    double deltaLat = lat2Rad - lat1Rad;
    double deltaLon = lon2Rad - lon1Rad;

    double a = sin(deltaLat / 2) * sin(deltaLat / 2) + cos(lat1Rad) * cos(lat2Rad) * sin(deltaLon / 2) * sin(deltaLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    double distance = earthRadius * c;
    return distance;
  }

}
