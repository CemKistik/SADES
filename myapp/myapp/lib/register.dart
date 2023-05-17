import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/register_pg1.dart';
import 'package:myapp/global_variables.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
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

                //button
                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const register1()),
                      );
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
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
