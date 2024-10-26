import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:login_project/utils/custom_toast.dart';
import 'package:login_project/views/realtime_database_screens/database_home_screen.dart';
import 'package:login_project/views/upload_profile.dart';
import 'package:login_project/widgets/custom_button.dart';
import 'package:login_project/widgets/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up Screen"),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: emailController,
                hintText: "Email",
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextField(
                controller: passwordController,
                hintText: "Password",
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                label: "Sign Up",
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    _auth
                        .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text)
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UploadProfile()));
                      Utils.customToast("Register Success");
                    }).onError((errore, stackTrace) {
                      Utils.customToast(errore.toString());
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
