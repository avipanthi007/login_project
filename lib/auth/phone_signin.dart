import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_project/auth/verify_phone.dart';
import 'package:login_project/utils/custom_toast.dart';
import 'package:login_project/widgets/custom_button.dart';
import 'package:login_project/widgets/custom_textfield.dart';

class PhoneSignin extends StatefulWidget {
  const PhoneSignin({super.key});

  @override
  State<PhoneSignin> createState() => _PhoneSigninState();
}

class _PhoneSigninState extends State<PhoneSignin> {
  final _auth = FirebaseAuth.instance;
  final mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mobile Auth"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment:MainAxisAlignment.center,children:[
          CustomTextField(hintText: "Mobile",controller: mobileController,),
          const SizedBox(height: 25,),
          CustomButton(label: "",onTap: (){
          _auth.verifyPhoneNumber(phoneNumber: mobileController.text,
          verificationCompleted: (_){},
           verificationFailed: (e){
            Utils.customToast(e.toString());
           },
            codeSent: (String verficationId ,int? token){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyPhone(verficationId: verficationId)));
            },
             codeAutoRetrievalTimeout: (e){
              Utils.customToast(e.toString());
             });
          },)
          
        ]),
      )
    );
  }
}