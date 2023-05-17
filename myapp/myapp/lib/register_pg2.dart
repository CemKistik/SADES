import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/register_pg3.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/global_variables.dart';
import 'package:myapp/user_model.dart';
import 'package:provider/provider.dart';

import 'auth_provider.dart';

class register2 extends StatefulWidget {
  const register2({Key? key}) : super(key: key);

  @override
  State<register2> createState() => _register2State();
}

class _register2State extends State<register2> {
  List<String> items = ['Kadın', 'Erkek', 'Diğer'];
  TextEditingController fnamecont = TextEditingController();
  TextEditingController lnamecont = TextEditingController();
  TextEditingController bdatecont = TextEditingController();
  TextEditingController heightcont = TextEditingController();
  TextEditingController weightcont = TextEditingController();
  TextEditingController ch_diseasecont = TextEditingController();
  TextEditingController medicinecont = TextEditingController();
  String? selectedItem = 'Kadın';
  @override
  void initState() {
    bdatecont.text = ""; //set the initial value of text field
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                          controller: fnamecont,
                          decoration: InputDecoration(
                            hintText: 'Ad',
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
                          controller: lnamecont,
                          decoration: InputDecoration(
                            hintText: 'Soyad',
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
                          controller: bdatecont,
                          //editing controller of this TextField
                          decoration: InputDecoration(
                            hintText: 'Doğum Tarihi',
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
                                bdatecont.text =
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
                          controller: heightcont,
                          decoration: InputDecoration(
                            hintText: 'Boy (cm)',
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
                          controller: weightcont,
                          decoration: InputDecoration(
                            hintText: 'Kilo (kg)',
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 66, 179, 210)),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: DropdownButtonFormField<String>(
                       
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10.0),
                        ),
                        value: selectedItem,
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child:
                                    Text(item, style: TextStyle(fontSize: 16))))
                            .toList(),
                        onChanged: (item) => setState(() => selectedItem = item
                        ),
                      ),
                    ),
                  ),

                  //cinsiyet
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
                        child: TextField(
                          controller: ch_diseasecont,
                          decoration: InputDecoration(
                            hintText: 'Kronik Hastalıklar',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //KronikHas
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
                        child: TextField(
                          controller: medicinecont,
                          decoration: InputDecoration(
                            hintText: 'Kullanılan İlaçlar',
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
                  //button
                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                           storeData();
                           Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const register3()),
                        );
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
                          'DEVAM',
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
    void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
      fname: fnamecont.text,
      lname: lnamecont.text,
      gender: selectedItem.toString(),
      weight: weightcont.text,
      height: heightcont.text,
      bdate: bdatecont.text,
      medicine: medicinecont.text,
      ch_disease: ch_diseasecont.text,
      first_aid_inf: "Yalnızca kullanıcı olarak devam et",
      phoneNumber: "",
      uid: "",
    );
      ap.saveUserDataToFirebase(
        context: context,
        userModel: userModel,
        onSuccess: () {
          ap.saveUserDataToSP().then(
                (value) => ap.setSignIn().then(
                      (value) => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const register3(),
                          ),
                          (route) => false),
                    ),
              );
        },
      );
  }

}
