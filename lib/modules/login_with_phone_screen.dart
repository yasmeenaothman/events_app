
import 'package:events_app/firebase_servises/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginWithPhoneScreen extends StatelessWidget {
  LoginWithPhoneScreen({Key? key}) : super(key: key);
  final phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: phoneNumberController,
            decoration: const InputDecoration(labelText: 'Phone number'),
            keyboardType: TextInputType.phone,
          ),
          ElevatedButton(
            onPressed: () {
              AuthRepo.verifyPhoneNumber(
                context: context,
                phoneNumber: phoneNumberController.text.trim(),
              );
            },
            child: const Text('Submit'),
          ),

        ],
      ),
    );
  }
}
