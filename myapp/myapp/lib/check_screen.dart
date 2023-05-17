import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/auth_provider.dart';
import 'package:myapp/main_screen.dart';
import 'package:myapp/register.dart';
import 'package:myapp/register_pg1.dart';
import 'package:myapp/global_variables.dart';
import 'package:provider/provider.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class  _CheckScreenState extends State<CheckScreen> {
  bool isAuth = false;
  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.checkExistingUser().then(
          (value) async {
            if (value == true) {
               setState(() {
        isAuth = true;
            });
         }
          }
    );
  }
  @override
  Widget build(BuildContext context) {
     Widget child;
    if (isAuth) {
      child = MainScreen();
    } else {
      child = register();
    }
    return Scaffold(
      body: child,
    );
  }
}