import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_project/utils/custom_toast.dart';
import 'package:login_project/views/realtime_database_screens/database_home_screen.dart';
import 'package:login_project/widgets/custom_button.dart';
import 'package:login_project/widgets/custom_textfield.dart';

class VerifyPhone extends StatefulWidget {
  final String verficationId;
  VerifyPhone({super.key, required this.verficationId});

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  final codeController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify-Phone Number"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomTextField(
            hintText: "6 Digit Code",
            controller: codeController,
            keyboardType: TextInputType.number,
            maxLength: 6,
          ),
          const SizedBox(
            height: 25,
          ),
          CustomButton(
            label: "Verify",
            onTap: () {
              final credential = PhoneAuthProvider.credential(
                  verificationId: widget.verficationId,
                  smsCode: codeController.text);

              try {
                _auth.signInWithCredential(credential);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DatabaseHomeScreen()));
              } catch (e) {
                Utils.customToast(e.toString());
              }
            },
          )
        ]),
      ),
    );
  }
}
