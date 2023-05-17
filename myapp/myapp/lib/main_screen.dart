import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/map_screen.dart';
import 'package:myapp/notification_screen.dart';
import 'package:myapp/settings_screen.dart';
import 'package:myapp/global_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:location/location.dart';



class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Location location = Location();
  String url = ' ';
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
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
             
              Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                
                //arama alanı
                /*
               SizedBox(
                width: 280,
                 child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: const Color.fromARGB(255, 66, 179, 210)),
                            
                        color: Colors.white,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: TextField(
                          
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Hedef Gir',
                            icon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),
                  ),
               ),
               */

             /*
               Flexible(
                 child: IconButton(onPressed: (() {
                   
                 }), icon: const Icon(Icons.star_border_sharp, size: 40, )),
               ),
               */
             
                Flexible(
                 child: IconButton(onPressed: (() {
                   Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationScreen()),
                      );
                 }), icon: gv.pressed ? const Icon(Icons.notifications_outlined, size: 40, color:  Colors.black ):
                 const Icon(Icons.notifications_outlined, size: 40, color:  Colors.white ),),
               ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                      'SADES',
                       style: gv.pressed
                    ? TextStyle(color: Colors.black, fontSize: 40)
                    : TextStyle(color:Colors.white, fontSize:40),
                     ),
              ),
                Flexible(
                 child: IconButton(onPressed: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsScreen()),
                      );
                 }), icon: gv.pressed ? const Icon(Icons.settings_outlined, size: 40, color:  Colors.black ):
                 const Icon(Icons.settings_outlined, size: 40, color:  Colors.white ),),
               ),
              ],
              ),
          
            const SizedBox(height: 50,),
              //button yardım iste
                
             const SizedBox(height: 50,),
               Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () 
                     async {
                       Position position = await _determinePosition();
                          String str = position.latitude.toString();
                          String str1 = position.longitude.toString();
                        launch('sms:05344819673?body= Acil durum koordinatları:  https://www.google.com/maps/@$str,$str1,19z');
                      
                      },
                // location.requestService().then((value){
                //   print(value); // istekten gelen deger

                // });
                
              //  location.serviceEnabled().then((value){
              //     print(value); // aktif olup olmadığını döndüren deger
              //   }); 

              //   if(await location.serviceEnabled()!= true){
              //     location.serviceEnabled().then((value){
              //     print(value); // aktif olup olmadığını döndüren deger
              //     }); 
              //   }

              //   else{
              //     print("izin verilmiş");
              //      location.onLocationChanged.listen((event) { 
              //        print(event.longitude);
              //       print(event.latitude);
                    
              //     });
                  
              //   }

              //      //kullanıcının konumuna erişmek için izin ister

              //   if(await location.hasPermission() != PermissionStatus.granted){
              //     location.requestPermission().then((value){
              //       print(value);
              //     });
              //   }
              //   else {
              //     print("zaten açık");
              //      location.onLocationChanged.listen((event) { 
              //       print(event.longitude);
              //       print(event.latitude);
                    
              //     });
              // }
              // var value = await location.getLocation();
              //  // var value2 = value.latitude!.toDouble();
              //   //var value3 = value.longitude!.toDouble();
              // String str = value.latitude!.toString();
              //   String str1 = value.longitude.toString();

              
                //launch('sms:05312097900?body= Acil durum koordinatları :', );
                //url = 'sms:05344819673?body= Acil durum koordinatları:  $value3 $value2 '; 
                //url = 'sms:05344819673?body= Acil durum koordinatları:  https://www.google.com/maps/@$str,$str1,19z';
               // launch('sms:05344819673?body= Acil durum koordinatları:  https://www.google.com/maps/@$str,$str1,19z');
                //  değişken $ile alınır.
                //urlLauncher(url);
               
                 //    },
                     
                    

                    child: Container(
                      height: 120,
                      width: 400,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color:  Color.fromARGB(255, 36, 191, 222),),
                      child: Center(
                          child: Text(
                        'yardim'.tr,
                        style: GoogleFonts.comfortaa(fontSize: 30, color: Colors.white,fontWeight: FontWeight.normal ),
                      
                      ),
                      ),
                    ),
                  ),
                ),
                
              

                 const SizedBox(height: 65,),
                  //button yol tarifi
               Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchPlaceScreen()),
                      );
                    },
                   

                    child: Container(
                      height: 120,
                      width: 400,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromARGB(255, 36, 191, 222),),
                      child: Center(
                          child: Text(
                        'tarif'.tr,
                         style: GoogleFonts.comfortaa(fontSize: 30, color: Colors.white,fontWeight: FontWeight.normal ),
                      ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 65,),
                  //button yol tarifi
               Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                       launch('https://enabiz.gov.tr/');
                    },
                   

                    child: Container(
                      height: 120,
                      width: 400,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromARGB(255, 36, 191, 222),),
                      child: Center(
                          child: Text(
                        'E-NABIZ',
                         style: GoogleFonts.comfortaa(fontSize: 30, color: Colors.white,fontWeight: FontWeight.normal ),
                      ),
                      ),
                    ),
                  ),
                ),

                /*
               const Spacer(),
               Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                
                //hastane vs. butonlar
               Flexible(
                 child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreen()),
                        );
                      },
               
                      child: Container(
                        height: 100,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: const Center(
                            child: Text(
                          'Hastane',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                        )),
                      ),
                    ),
               ),
                        
                         Flexible(
                 child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreen()),
                        );
                      },
               
                      child: Container(
                        height: 100,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: const Center(
                            child: Text(
                          'Aile Sağlığı Merkezi',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                        )),
                      ),
                    ),
               ),
               
                Flexible(
                 child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreen()),
                        );
                      },
               
                      child: Container(
                        height: 100,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: const Center(
                            child: Text(
                          'Eczane',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                        )),
                      ),
                    ),
               ),
                       
                         ],
                         ),

*/
            ],
          ),
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
}
void urlLauncher(String url) async {
  if(await canLaunch(url)) {
    await launch(url);

  }
  else {
    throw 'Could not launch $url';
  }
}
