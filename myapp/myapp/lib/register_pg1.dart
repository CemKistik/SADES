// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/auth_provider.dart';
import 'package:myapp/register_pg2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/global_variables.dart';
import 'package:provider/provider.dart';

class register1 extends StatefulWidget {
  const register1({Key? key}) : super(key: key);

  @override
  State<register1> createState() => _register1State();
}

class _register1State extends State<register1> {
  TextEditingController phoneController = TextEditingController();
  //TextEditingController otpController = TextEditingController();
  //FirebaseAuth auth = FirebaseAuth.instance;
 // bool otpVisibility = false;
  //User? user;
  //String verificationID = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),

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

                //email
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 66, 179, 210)),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                         controller: phoneController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Telefon numarası',
                          
                        ),
                      ),
                    ),
                  ),
                ),
                //password
                const SizedBox(
                  height: 10,
                ),
        //        Visibility(
        //          visible: otpVisibility,
        //       child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //     child: Container(
        //             decoration: BoxDecoration(
        //               border: Border.all(
        //                   color: const Color.fromARGB(255, 66, 179, 210)),
        //               borderRadius: BorderRadius.circular(20),
        //               color: Colors.white,
        //             ),
        //             child: Padding(
        //               padding: EdgeInsets.only(left: 10),
        //               child: TextFormField(
        //                  controller: otpController,
        //                 decoration: InputDecoration(
        //                   border: InputBorder.none,
        //                   hintText: 'Doğrulama kodunu giriniz',
        //                 ),
        //               ),
        //             ),
        //           ),
        //       )
        // ),
                
  const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                    
                   //sendPhoneNumber();
                      
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:  Color.fromARGB(255, 36, 191, 222),),
                      child:  Center(
                          child: Text(
                          "Kaydol",
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
        )),
      ),
    );
  }
   void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text;
    ap.signInWithPhone(context, "+90$phoneNumber");
  }
// void loginWithPhone() async {
//     await auth.verifyPhoneNumber(
//       phoneNumber: "+90" + phoneController.text,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await auth.signInWithCredential(credential).then((value) {
//         });
//       },
//       verificationFailed: (FirebaseAuthException e) {
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         otpVisibility = true;
//         verificationID = verificationId;
//         setState(() {});
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//   }

//   void verifyOTP() async {
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: verificationID, smsCode: otpController.text);

//     await auth.signInWithCredential(credential).then(
//       (value) {
//         setState(() {
//           user = FirebaseAuth.instance.currentUser;
//         });
//       },
//     ).whenComplete(
//       () {
//         if (user != null) {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => register2(),
//             ),
//           );
//         } else {
//           Fluttertoast.showToast(
//             msg: "your login is failed",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.BOTTOM,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.0,
//           );
//         }
//       },
//     );
//   }

  

}
