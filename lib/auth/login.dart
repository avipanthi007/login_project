import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_project/auth/password_reset_link.dart';
import 'package:login_project/auth/phone_signin.dart';
import 'package:login_project/auth/signup.dart';
import 'package:login_project/utils/custom_toast.dart';
import 'package:login_project/views/realtime_database_screens/database_home_screen.dart';
import 'package:login_project/widgets/custom_button.dart';
import 'package:login_project/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  bool obsecure = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Screen"),
          automaticallyImplyLeading: false,
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: emailController,
                  hintText: "Enter Email",
                ),
                SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  controller: passwordController,
                  hintText: "Enter Password",
                  // obsecureText: obsecure,
                  suffix: IconButton(
                      onPressed: () {
                        obsecure = !obsecure;
                        setState(() {});
                      },
                      icon: obsecure
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility)),
                ),
                SizedBox(
                  height: 30,
                ),
                isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(
                        label: "Log In",
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            _auth
                                .signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text)
                                .then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DatabaseHomeScreen()));
                              setState(() {
                                isLoading = false;
                              });
                              Utils.customToast("Login Success");
                            }).onError((errore, stackTrace) {
                              Utils.customToast(errore.toString());
                            });
                          }
                        },
                      ),
                Row(
                  children: [
                    Spacer(),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PasswordResetEmailLink()));
                        },
                        child: Text("Forget Password?"))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account ? "),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                        },
                        child: Text("SignUp"))
                  ],
                ),
                CustomButton(
                  label: "LogIn With Mobile",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PhoneSignin()));
                  },
                )
              ],
            ),
          ),
        ));
  }
}
