import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/information.dart';
import 'package:myapp/main_screen.dart';
import 'package:myapp/global_variables.dart';

import 'package:myapp/update_first_aid.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'auth_provider.dart';

class weight extends StatefulWidget {
  const weight({Key? key}) : super(key: key);

  @override
  State<weight> createState() => _weightState();
}

class _weightState extends State<weight> {
  TextEditingController kilo = TextEditingController();
  TextEditingController boy = TextEditingController();
  @override  
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),

      // ignore: prefer_const_literals_to_create_immutables
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(gv.assetPath),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Center(
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //opening text
                  SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: Text(
                      'SADES',
                       style: gv.pressed
                    ? TextStyle(color: Colors.black, fontSize: 40)
                    : TextStyle(color:Colors.white, fontSize:40),
                     ),
                  ),
                  //TextStyle(fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold ),),
                  
                  //email
                  SizedBox(
                    height: 30,
                  ),

                 Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 66, 179, 210)),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Lütfen boyunuzu giriniz.';
                            }
                            return null;
                          },
                          controller: boy,
                          decoration: InputDecoration(
                            hintText: 'boy'.tr,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //boy
                  SizedBox(
                    height: 10,
                  ),
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 66, 179, 210)),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Lütfen kilonuzu giriniz.';
                            }
                            return null;
                          },
                          controller: kilo,
                          decoration: InputDecoration(
                            hintText: 'kilo'.tr,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //kilo
                  SizedBox(
                    height: 10,
                  ),
                  

                  //doğumtarihi
                  SizedBox(
                    height: 10,
                  ),

                 
                  //ilaçlar
                  SizedBox(
                    height: 10,
                  ),
                  //button
                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreen()),
                        );
                            FirebaseFirestore.instance
                          .collection("user")
                          .doc(ap.userModel.uid)
                          .update({'weight': kilo.text, 'height': boy.text});
                          
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                       
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:  Color.fromARGB(255, 36, 191, 222),),
                        child: Center(
                            child: Text(
                          'bilgi'.tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}