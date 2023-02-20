
import 'dart:async';

import 'package:events_app/firebase_servises/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyScreen extends StatefulWidget {
  static const String routeName = "/VerifyScreen";
  final String verificationId;
  final String phoneNumber;
  VerifyScreen({Key? key,required this.verificationId,required this.phoneNumber}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final codeController = TextEditingController();
  bool isResendBtnEnabled = true;
  int countDownVal = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: codeController,
            decoration: const InputDecoration(labelText: '6-digit code'),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: ()=> AuthRepo.verifyCode(context, widget.verificationId, codeController.text.trim()),
            child: const Text('Verify'),
          ),
          ElevatedButton(
            onPressed: isResendBtnEnabled?clickResendBtn: null,
            child: const Text(
              'Resend the code',
            ),
          ),
          Visibility(
            visible: !isResendBtnEnabled,
            child: Text(
              'after $countDownVal seconds',
            ),
          ),
        ],
      ),
    );
  }

  clickResendBtn(){
    setState(() async {
      isResendBtnEnabled = false;
      await startTimer();
    });
    AuthRepo.verifyPhoneNumber(context: context, phoneNumber: widget.phoneNumber);
  }
  startTimer(){
    Timer.periodic(const Duration(seconds: 1), (_) {
      if ( countDownVal != 0) {
        setState(() {
          countDownVal --;
        });
      } else {
        setState(() {
          isResendBtnEnabled = true;
        });
      }
    });
  }
}
