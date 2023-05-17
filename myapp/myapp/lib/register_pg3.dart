import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/auth_provider.dart';
import 'package:myapp/main_screen.dart';
import 'package:myapp/register_pg2.dart';
import 'package:flutter/scheduler.dart';
import 'package:myapp/global_variables.dart';
import 'package:provider/provider.dart';

class register3 extends StatefulWidget {
  
  const register3({Key? key}) : super(key: key);
   
  @override
  State<register3> createState() => _register3State();
}

class _register3State extends State<register3> {
  final _formKey = GlobalKey<FormState>();
  @override
  bool _value =  false;
  bool _value2 = false;
  bool _value3 = false;
    bool showErrorMessage = false;
    String errmessage = "";
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //opening text

                 Text(
                      'SADES',
                       style: gv.pressed
                    ? TextStyle(color: Colors.black, fontSize: 40)
                    : TextStyle(color:Colors.white, fontSize:40),
                     ),
                  //TextStyle(fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold ),),

                  SizedBox(
                    height: 30,
                  ),
//sağlıkçal.
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 66, 179, 210)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CheckboxListTile(
                        title: const Text('Sağlık Çalışanıyım'),
                        value: _value,
                        checkColor: Colors.white,
                        activeColor:  Color.fromARGB(255, 36, 191, 222),
                        onChanged: (bool? value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                      ),
                    ),
                  ),

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
                      ),
                      child: CheckboxListTile(
                        title: const Text('İlk Yardım Sertifikam Var'),
                        value: _value2,
                        checkColor: Colors.white,
                        activeColor:  Color.fromARGB(255, 36, 191, 222),
                        onChanged: (bool? value) {
                          setState(() {
                            _value2 = value!;
                          });
                        },
                      ),
                    ),
                  ),
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
                      ),
                      child: CheckboxListTile(
                        title: const Text('Yalnızca Kullanıcı Olarak Devam Et'),
                        value: _value3,
                        checkColor: Colors.white,
                        activeColor:  Color.fromARGB(255, 36, 191, 222),
                        onChanged: (bool? value) {
                          setState(() {
                            _value3 = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  //button
                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () {
                        if (_value == false &&
                            _value2 == false &&
                            _value3 == false) {
                              setState(() => { errmessage= "İlerlemek için birini seçmeniz gerekmektedir!",
                                showErrorMessage=true});
                            }
                            else if ((_value == true &&
                            _value2 == false &&
                            _value3 == true)||(_value == false &&
                            _value2 == true &&
                            _value3 == true)||(_value == true &&
                            _value2 == true &&
                            _value3 == true)) {
                              setState(() => { errmessage= "Bu seçenekleri aynı anda seçemezsiniz!",
                                showErrorMessage=true});
                            }
                        else{
                           setState(() => {
                                showErrorMessage=false});
                                if(_value==true && _value2==false && _value3==false){
                                  FirebaseFirestore.instance
                            .collection("user")
                            .doc(ap.userModel.uid)
                            .set({'first_aid_inf': 'Sağlık Çalışanıyım'});
                                 }
                               else if(_value==false && _value2==true && _value3==false){
                                  FirebaseFirestore.instance
                            .collection("user")
                            .doc(ap.userModel.uid)
                            .set({'first_aid_inf': 'İlk Yardım Sertifikam Var'});
                                 }
                                 else if(_value==false && _value2==false && _value3==true){
                                  FirebaseFirestore.instance
                            .collection("user")
                            .doc(ap.userModel.uid)
                            .set({'first_aid_inf': 'Yalnızca Kullanıcı Olarak Devam Et'});}
                            else if(_value==true && _value2==true && _value3==false){
                                  FirebaseFirestore.instance
                            .collection("user")
                            .doc(ap.userModel.uid)
                            .set({'first_aid_inf': 'Sağlık Çalışanıyım, İlk Yardım Sertifikam Var'});}
                          
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreen()),
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
                          'KAYDOL',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                   SizedBox(height: 20.0),
                  showErrorMessage ? 
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(80.0)
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('$errmessage')
                )
              )
               : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
