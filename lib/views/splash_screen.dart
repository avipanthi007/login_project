import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_project/firebase_services/firebase_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseServices services = FirebaseServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    services.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Splash Screen")),
    );
  }
}
