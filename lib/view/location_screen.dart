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

  Future<String> getMyPostion() async {
    await Geolocator.requestPermission();
    Position position = await _geolocatorPlatform.getCurrentPosition();
    myPosition = 'Latitude: ' +
        position.latitude.toString() +
        ' - Longitude: ' +
        position.longitude.toString();
    return myPosition;
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
        child: FutureBuilder(
          future: getMyPostion(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            print(snapshot.connectionState);
            print(snapshot.data);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Text(snapshot.data);
            } else {
              return Text('');
            }
          },
        ),
      ),
    );
  }
}
