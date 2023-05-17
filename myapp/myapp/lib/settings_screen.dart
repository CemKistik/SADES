import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/information.dart';
import 'package:myapp/language_screen.dart';
import 'package:myapp/map_screen.dart';
import 'package:myapp/register_pg2.dart';
import 'package:myapp/theme_screen.dart';
import 'package:myapp/update_profile.dart';
import 'package:myapp/global_variables.dart';
import 'package:url_launcher/url_launcher.dart';




class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
    String assetPath="images/resim.jpg";
  String color="Color.fromARGB(255, 0, 0, 0),";
  bool pressed = true;
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
             
            const SizedBox(height: 100, width: 50,),
              //button dil

              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: Text(
                      'SADES',
                       style: gv.pressed
                    ? TextStyle(color: Colors.black, fontSize: 40)
                    : TextStyle(color:Colors.white, fontSize:40),
                     ),
                ),
              ),
               Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  LanguageScreen()),
                      );
                    },

                    child: Container(
                      height: 80,
                      width: 400,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color:  Color.fromARGB(255, 36, 191, 222),
                           // border: Border.all(color: Colors.black),
                          ),
                          
                      child: Center(
                          child: Text(
                        'dil'.tr,
                         style: GoogleFonts.roboto(fontSize: 25, color: Colors.white,fontWeight: FontWeight.normal ),
                      )),
                    ),
                  ),
                ),
     
                  //button tema
               Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),

                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThemeScreen()),
                      );
                    },

                    child: Container(
                      height: 80,
                      width: 400,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color:  Color.fromARGB(255, 36, 191, 222),),
                      child: Center(
                          child: Text(
                        'tema'.tr,
                        style: GoogleFonts.roboto(fontSize: 25, color: Colors.white,fontWeight: FontWeight.normal ),
                      )),
                    ),
                  ),
                ),
                //buton bilgilerimi güncelle

               Padding(
                                padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),

                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InformationScreen()),
                      );
                    },

                    child: Container(
                      height: 80,
                      width: 400,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromARGB(255, 36, 191, 222),),
                      child:  Center(
                          child: Text(
                        'bilgi'.tr,
                         style: GoogleFonts.roboto(fontSize: 25, color: Colors.white,fontWeight: FontWeight.normal ),
                      )),
                    ),
                  ),
                ),

                Padding(
                                padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),

                  child: GestureDetector(
                    onTap: () {
                       launch('mailto:eceozcan4947@gmail.com?subject=Help');
                    },

                    child: Container(
                      height: 80,
                      width: 400,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromARGB(255, 36, 191, 222),),
                      child:  Center(
                          child: Text(
                        'ile'.tr,
                         style: GoogleFonts.roboto(fontSize: 25, color: Colors.white,fontWeight: FontWeight.normal ),
                      )),
                    ),
                  ),
                ),
                //buton ilk yardım bilgisi ekle/güncelle
    
              
            ],
               
          ),
        ),
      ),
    );
  }
}
