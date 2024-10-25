import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DatabaseHomeScreen extends StatefulWidget {
  const DatabaseHomeScreen({super.key});

  @override
  State<DatabaseHomeScreen> createState() => _DatabaseHomeScreenState();
}

class _DatabaseHomeScreenState extends State<DatabaseHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Home Screen"),),);
  }
}