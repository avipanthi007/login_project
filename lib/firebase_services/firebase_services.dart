import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_project/auth/login.dart';
import 'package:login_project/views/realtime_database_screens/database_home_screen.dart';

class FirebaseServices {
  final auth = FirebaseAuth.instance;

  isLogin(context) {
    if (auth.currentUser != null) {
      Timer(Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DatabaseHomeScreen()));
      });
    } else {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }
  }
}
