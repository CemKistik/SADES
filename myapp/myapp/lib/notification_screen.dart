// ignore_for_file: prefer_const_literals_to_create_immutables, sort_child_properties_last, unnecessary_const

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:myapp/main_screen.dart';
import 'package:myapp/map_screen.dart';
import 'package:myapp/settings_screen.dart';
import 'package:myapp/global_variables.dart';
import 'dart:math';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myapp/notification.dart';
import 'package:myapp/fire_data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as cp1;
import 'package:map_launcher/map_launcher.dart' as cp2;




class NotificationScreen extends StatefulWidget {
  const NotificationScreen({ Key? key}): super(key:key);
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}
const kGoogleApiKey = 'AIzaSyBYjgb1RlXrDhLMKpoWF8XhxDN5k2aej9U';
final homeScaffoldKey = GlobalKey<ScaffoldState>();
late double lng2;
late double lat2;
User user;
class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xfff7f4ef),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
           image: AssetImage(gv.assetPath),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
             
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: GestureDetector(
                     onTap: () {
                      routes();
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (context) => MainScreen() ),
                       );
                     },
                           
                     child: Container(
                       alignment: Alignment.center,
                       height: 135,
                       padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                       decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                         border: Border.all(color:Color.fromARGB(255, 36, 191, 222),), borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
                       ),
                       child: const Center(
                           child: Text(
                         'Ad:'$user.fname,
                          'Soyad:'$user.lname,
                           'Doğum Tarihi:'$user.bdate,
                            'Kronik Hastalık:'$user.ch_disease,
                             'Kullandığı İlaçlar:'$user.medicine,
                         textAlign: TextAlign.left,
                         style: TextStyle(
                             color: Color.fromARGB(255, 0, 0, 0),
                             fontSize: 20,
                             fontWeight: FontWeight.normal),
                       )
                       ),
                     ),
                   ),
              ),
            
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
        height: 75,
        width: 184,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: MaterialButton(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                 /*
               const Opacity(
                    opacity: 0.0,
                    child: const CircleAvatar(
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.indigo,
                    ),
                  ),
                 */
                   Text(
                    "kabul".tr,
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  const CircleAvatar(
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.green,
                  ),
                ],
              ),
            ),
            color:  Color.fromARGB(255, 36, 191, 222),
            disabledColor: Color.fromARGB(255, 24, 53, 212),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            onPressed: () async {
              Position position = await _determinePosition();
                 routes(position);
            },
          ),
        ),
    ),
               SizedBox(
        height: 75,
        width: 160,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: MaterialButton(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                 /*
               const Opacity(
                    opacity: 0.0,
                    child: const CircleAvatar(
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.indigo,
                    ),
                  ),
                 */
                   Text(
                    "sil".tr,
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  const CircleAvatar(
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.red,
                  ),
                ],
              ),
            ),
            color:   Color.fromARGB(255, 36, 191, 222),
            disabledColor: Color.fromARGB(255, 24, 53, 212),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
    ),
              ],),

            
             
           
           



            
             ],)
          
           
          ),
      ),
     
    );
  }
Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }

Future<void> routes(Position position) async {
     double curLat = position.latitude;
    double curLong =position.longitude ;
    double desLat = data.position.latitude;
    double desLong = data.position.longitude;

     if(await cp2.MapLauncher.isMapAvailable(
              cp2.MapType.google)!=null){
              cp2.MapLauncher.showDirections(mapType: cp2.MapType.google, destination: cp2.Coords(desLat, desLong),origin: cp2.Coords(curLat, curLong));
                    // anlık konumun ankaranın merkezine rotası 
            }

    setState(() {});
  }


}
