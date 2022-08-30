import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  @override
  void initState() {
    super.initState();
  }

  Future<void> getMyPostion() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    _geolocatorPlatform.getCurrentPosition().then((Position position) {
      myPosition = 'Latitude: ' +
          position.latitude.toString() +
          ' - Longitude: ' +
          position.longitude.toString();
      setState(() {
        myPosition = myPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget myWidget;
    if (myPosition == '') {
      myWidget = CircularProgressIndicator();
    } else {
      myWidget = Text(myPosition);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Миний байршил'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                getMyPostion();
              },
              child: Text('Location'),
            ),
            myWidget,
          ],
        ),
      ),
    );
  }
}
