import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/information.dart';
import 'package:myapp/map_screen.dart';
import 'package:myapp/register_pg2.dart';
import 'package:myapp/settings_screen.dart';
import 'package:myapp/update_profile.dart';
import 'package:myapp/global_variables.dart';





class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       //backgroundColor: Color(0xfff7f4ef),
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
                      Get.updateLocale(Locale("tr","TR"));
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
                        'turkce'.tr,
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
                       Get.updateLocale(Locale("en","EN"));
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
                        'ing'.tr,
                        style: GoogleFonts.roboto(fontSize: 25, color: Colors.white,fontWeight: FontWeight.normal ),
                      )),
                    ),
                  ),
                ),
                //buton bilgilerimi güncelle

              
    
              
            ],
               
          ),
        ),
      ),
    );
  }
}
