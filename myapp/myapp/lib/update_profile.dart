import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/main_screen.dart';
import 'package:myapp/global_variables.dart';

import 'package:myapp/update_first_aid.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'auth_provider.dart';
import 'information.dart';

class updateprofile extends StatefulWidget {
  const updateprofile({Key? key}) : super(key: key);

  @override
  State<updateprofile> createState() => _updateprofileState();
}

class _updateprofileState extends State<updateprofile> {
  TextEditingController ad = TextEditingController();
  TextEditingController soyad = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }
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
                              return 'Lütfen adınızı giriniz.';
                            }
                            return null;
                          },
                          controller: ad,
                          decoration: InputDecoration(
                            hintText: 'ad'.tr,
                            // hintText: 'ad'.tr+': ${ap.userModel.fname}',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //ilaçlar
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
                              return 'Lütfen soyadınızı giriniz.';
                            }
                            return null;
                          },
                          controller: soyad,
                          decoration: InputDecoration(
                            hintText: 'soyad'.tr,
                            // hintText: 'soyad'.tr+': ${ap.userModel.lname}',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //ilaçlar
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
                              return 'Lütfen doğum tarihinizi seçiniz.';
                            }
                            return null;
                          },
                          controller: dateInput,
                          //editing controller of this TextField
                          decoration: InputDecoration(
                            hintText: 'dogum'.tr,
                            // hintText: 'dogum'.tr+': ${ap.userModel.bdate}',
                            border: InputBorder.none,

                            icon: Icon(Icons.calendar_today), //icon of text field
                          ),
                          readOnly: true,
                          //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100));

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              setState(() {
                                dateInput.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {}
                          },
                        ),
                      ),
                    ),
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
                            .update({'fname': ad.text, 'lname': soyad.text, 'bdate': dateInput.text});
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