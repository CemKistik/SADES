//import 'dart:html';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/auth_provider.dart';
import 'package:myapp/check_screen.dart';
import 'package:myapp/map_screen.dart';
import 'package:myapp/notification_screen.dart';
import 'package:myapp/register_pg2.dart';
import 'package:myapp/settings_screen.dart';
import 'package:myapp/theme_screen.dart';
import 'package:myapp/themes.dart';
import 'package:myapp/update_first_aid.dart';
import 'dil.dart';
import 'register_pg1.dart';
import 'register.dart';
import 'main_screen.dart';
import 'map_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/map.dart';
import 'currentLocation.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();  
  await Firebase.initializeApp();
  runApp(Mine());
}

class Mine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {   
    return MultiProvider(
    providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: GetMaterialApp(
    
          translations: Dil(),
      //supportedLocales:Dil.diller,
      locale:Get.locale==null ? Get.deviceLocale : Get.locale,
      fallbackLocale:Dil.varsayilan ,
      debugShowCheckedModeBanner :false,
      theme:Themes().lightTheme,
      darkTheme:Themes().darkTheme,
      home: (FirebaseAuth.instance.currentUser != null)
          ? MainScreen()
          : register(),
      
      )
    );
  }
}


