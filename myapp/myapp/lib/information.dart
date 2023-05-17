import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/chronic.dart';
import 'package:myapp/map_screen.dart';
import 'package:myapp/register_pg2.dart';
import 'package:myapp/update_first_aid.dart';
import 'package:myapp/update_profile.dart';
import 'package:myapp/weight.dart';
import 'package:myapp/global_variables.dart';




class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
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
                            builder: (context) => const updateprofile()),
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
                        'adsoyad'.tr,
                         style: GoogleFonts.roboto(fontSize: 19, color: Colors.white,fontWeight: FontWeight.normal ),
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
                            builder: (context) => const weight()),
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
                        'kiloboy'.tr,
                        style: GoogleFonts.roboto(fontSize: 19, color: Colors.white,fontWeight: FontWeight.normal ),
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
                            builder: (context) => const chronic()),
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
                        'kronikilac'.tr,
                         style: GoogleFonts.roboto(fontSize: 19, color: Colors.white,fontWeight: FontWeight.normal ),
                      )),
                    ),
                  ),
                ),
                //buton ilk yardım bilgisi ekle/güncelle
               Padding(
                                padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),

                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const updatefirstaid()),
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
                        'ilkyardimbil'.tr,
                         style: GoogleFonts.roboto(fontSize: 19, color: Colors.white,fontWeight: FontWeight.normal ),
                      )),
                    ),
                  ),
                ),
              
            ],
               
          ),
        ),
      ),
    );
  }
}
