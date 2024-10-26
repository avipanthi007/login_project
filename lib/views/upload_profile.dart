import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_project/utils/custom_toast.dart';
import 'package:login_project/views/realtime_database_screens/database_home_screen.dart';
import 'package:login_project/widgets/custom_button.dart';
import 'package:login_project/widgets/custom_textfield.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UploadProfile extends StatefulWidget {
  const UploadProfile({super.key});

  @override
  State<UploadProfile> createState() => _UploadProfileState();
}

class _UploadProfileState extends State<UploadProfile> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  File? _image;
  final picker = ImagePicker();
  DatabaseReference databaseRef = FirebaseDatabase.instance.ref('Data');
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  Future pickGalleryImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        Utils.customToast("Image Not Selected");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Upload Details")),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  pickGalleryImage();
                },
                child: Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    child: _image != null
                        ? Image.file(_image!.absolute)
                        : const Icon(Icons.image),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.blue)),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextField(
                controller: nameController,
                hintText: "Name",
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextField(
                controller: mobileController,
                hintText: "Mobile",
                keyboardType: TextInputType.number,
                maxLength: 10,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextField(
                controller: addressController,
                maxLines: 3,
                hintText: "Address",
              ),
              const SizedBox(
                height: 25,
              ),
              CustomButton(
                label: "Submit",
                onTap: () async {
                  firebase_storage.Reference ref = await firebase_storage
                      .FirebaseStorage.instance
                      .ref('/images' + 'img');
                  firebase_storage.UploadTask uploadTask =
                      ref.putFile(_image!.absolute);
                  print("uploadTask - ${uploadTask.snapshot.ref.fullPath}");
                  await Future.value(uploadTask).then((value) async {
                    var newUrl = await ref.getDownloadURL();

                    databaseRef.child("1").set({
                      'id': 1,
                      'name': nameController.text,
                      'mobile': mobileController.text,
                      'address': addressController.text,
                      'profile': newUrl.toString()
                    }).then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DatabaseHomeScreen();
                      }));
                      Utils.customToast("Upload Success");
                    }).onError((errore, stackTrace) {
                      Utils.customToast(errore.toString());
                    });
                  }).onError((errore, stackTrace) {
                    Utils.customToast(errore.toString());
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
