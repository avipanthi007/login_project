import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:login_project/auth/login.dart';
import 'package:login_project/utils/custom_toast.dart';

class DatabaseHomeScreen extends StatefulWidget {
  const DatabaseHomeScreen({super.key});

  @override
  State<DatabaseHomeScreen> createState() => _DatabaseHomeScreenState();
}

class _DatabaseHomeScreenState extends State<DatabaseHomeScreen> {
  final ref = FirebaseDatabase.instance.ref('Data');

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
          actions: [
            IconButton(
                onPressed: () {
                  _auth.signOut().then((value) {
                    Utils.customToast("Log Out");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()));
                  }).onError((errore, stackTrace) {
                    Utils.customToast(errore.toString());
                  });
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: FirebaseAnimatedList(
            query: ref,
            itemBuilder: (context, snapshot, animated, index) {
              return Column(
                children: [
                  Container(
                    height: Get.height * 0.4,
                    width: Get.width,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: Image.network(
                      snapshot.child('profile').value.toString(),
                      fit: BoxFit.fill,
                    ),
                  ),
                  kRepeatedContainer(snapshot,
                      "Name : " + snapshot.child('name').value.toString()),
                  kRepeatedContainer(
                      snapshot,
                      "Mobile Number : " +
                          snapshot.child('mobile').value.toString()),
                  kRepeatedContainer(
                      snapshot,
                      "Address : " +
                          snapshot.child('address').value.toString()),
                ],
              );
            }));
  }

  Container kRepeatedContainer(DataSnapshot snapshot, String title) {
    return Container(
        height: Get.height * 0.07,
        padding: const EdgeInsets.all(10),
        width: Get.width,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), border: Border.all()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ));
  }
}
