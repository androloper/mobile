import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  List<Marker> places = <Marker>[];
  BitmapDescriptor? carIcon;

  iconMaker(context) {
    ImageConfiguration config = createLocalImageConfiguration(context);
    BitmapDescriptor.fromAssetImage(config, 'assets/car.png', ).then((icon)=>{
      carIcon = icon
    });
  }

  // var openedLocation;

  Future<void> getLocation() async {
    if (await Geolocator.checkPermission() == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy:
            LocationAccuracy.best); //ios ~0m android 0-100m for best accuracy
    debugPrint(
        'Latitude: ${location.latitude} \nLongitude: ${location.longitude} \nWhole information: ${location}');
    setState(() {
      lat = location.latitude;
      lng = location.longitude;
    });
  }

  Future<void> goLocation() async {
    GoogleMapController controller = await mapControl.future;
    var goPlace = CameraPosition(target: LatLng(38.4392077, 27.2064136),zoom:18);
    var goingPlace = Marker(
      markerId: const MarkerId('Id'),
      position: LatLng(lat, lng),
      infoWindow: const InfoWindow(title: 'RBHome', snippet: 'Home'),
      icon: carIcon!,
    );
    setState(() {
      places.add(goingPlace);
    });
    controller.animateCamera(CameraUpdate.newCameraPosition(goPlace));
  }

  // @override
  // void initState() async {
  //   super.initState();
  //   getLocation(); // Call getLocation() to set lat and lng
  //   openedLocation = CameraPosition(target: LatLng(lat, lng));
  // }


  Completer<GoogleMapController> mapControl = Completer();
  var openedLocation = const CameraPosition(target: LatLng(38.4392077, 27.2064136), zoom: 10);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    iconMaker(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          foregroundColor: Theme.of(context).colorScheme.background,
          title: Text('Live Tracking App'),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                width: width,
                height: height*.5,
                child: GoogleMap(
                  initialCameraPosition: openedLocation,
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller){
                    mapControl.complete(controller);
                  },
                  markers: Set<Marker>.of(places),
                  // trafficEnabled: true,
                ),
              ),
              Text('Latitude: $lat'),
              Text('Longitude: $lng'),
              ElevatedButton(
                  onPressed: () {
                    getLocation();
                  },
                  child: Text('GetLocationInfo')),
              ElevatedButton(
                  onPressed: () {
                    goLocation();
                  },
                  child: Text('GoLocation'))
            ],
          ),
        ));
  }
}
