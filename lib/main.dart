import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawfect_match/authenticationScreen/login_screen.dart';
import 'package:pawfect_match/controllers/authentication_controller.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async 
{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp().then((value) {
    Get.put(AuthenticationController());
  });
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pawfect match',
      theme: ThemeData.dark().copyWith(

        scaffoldBackgroundColor: Colors.black,
      ),
      home: LoginScreen(),
    );
  }
}
