import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<Placemark> _placemarks = [];

  @override
  void initState() {
    super.initState();
    _getPlacemarks();
  }

  Future<void> _getPlacemarks() async {
    try {
      // Replace with your desired latitude and longitude values
      double latitude = 37.45;
      double longitude = -122.0840575;

      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      setState(() {
        _placemarks = placemarks;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Geocoding Example'),
        ),
        body: Center(
          child: _placemarks != null
              ? ListView.builder(
                  itemCount: _placemarks.length,
                  itemBuilder: (context, index) {
                    Placemark placemark = _placemarks[index];
                    return ListTile(
                      title: Text(placemark.name.toString()),
                      subtitle: Text(
                          '${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}'),
                    );
                  },
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}















// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Geocoding Demo',
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String _address = '';

//   Future<void> _getAddress(double latitude, double longitude) async {
//     try {
//       List<Placemark> placemarks =
//           await placemarkFromCoordinates(latitude, longitude);
//       Placemark placemark = placemarks[0];

//       setState(() {
//         _address =
//             '${placemark.street}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.country}';
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Geocoding Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Tap the button to get your address:',
//             ),
//             Text(
//               '$_address',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 await _getAddress(48.858093,
//                     2.294694); // Replace with your own latitude and longitude values
//               },
//               child: Text('Get Address'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
