

import 'package:myapp/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:myapp/register.dart';
import 'package:myapp/register_pg1.dart';
import 'package:myapp/register_pg2.dart';
import 'package:provider/provider.dart';

import 'auth_provider.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
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
                         controller: otpController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Doğrulama Kodu',
                          
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
                    otpCode=otpController.text;
                   if (otpCode != null) {
                              verifyOtp(context, otpCode!);
                            } else {
                    
                            }
                      
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:  Color.fromARGB(255, 36, 191, 222),),
                      child:  Center(
                          child: Text(
                          "Doğrula",
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

  // verify otp
  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
      context: context,
      verificationId: widget.verificationId,
      userOtp: userOtp,
      onSuccess: () {
        // checking whether user exists in the db
        ap.checkExistingUser().then(
          (value) async {
            if (value == true) {
              // user exists in our app
              ap.getDataFromFirestore().then(
                    (value) => ap.saveUserDataToSP().then(
                          (value) => ap.setSignIn().then(
                                (value) => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const register1(),
                                    ),
                                    (route) => false),
                              ),
                        ),
                  );
            } else {
              // new user
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const register2()),
                  (route) => false);
            }
          },
        );
      },
    );
    
  }
}