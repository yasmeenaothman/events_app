
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../riverpod/providers/auth_providers.dart';
import '../riverpod/providers/counter_provider.dart';

class PhoneVerificationPage extends HookConsumerWidget {
  static const String routeName = "/VerifyScreen";
  PhoneVerificationPage({Key? key}) : super(key: key);
  final codeController = TextEditingController();
  @override
  Widget build(BuildContext context, ref) {
    final firebaseAuthProvider = ref.watch(firebaseAuthStateProvider.notifier);
    final counter = ref.watch(counterProvider);
    final isResendBtnEnabled = ref.watch(isResendBtnEnabledProvider);
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
            onPressed: () => firebaseAuthProvider.verifyCode(
                context,
                firebaseAuthProvider.verificationId!,
                codeController.text.trim()),
            child: const Text('Verify'),
          ),
          ElevatedButton(
            onPressed: isResendBtnEnabled
                ? () => clickResendBtn(
                    firebaseAuthProvider, context,ref)
                : null,
            child: const Text(
              'Resend the code',
            ),
          ),
          Visibility(
            visible: !isResendBtnEnabled,
            child: Text(
              'after $counter seconds',
            ),
          ),
        ],
      ),
    );
  }

  clickResendBtn(FirebaseAuthProvider firebaseAuthProvider,BuildContext context,WidgetRef ref) async{
    StateController btnStateController = ref.read(isResendBtnEnabledProvider.notifier);
    btnStateController.state = false;
    await startTimer(ref);
    firebaseAuthProvider.verifyPhoneNumber(context: context, phoneNumber: firebaseAuthProvider.phoneNumber!);
  }
  startTimer(WidgetRef ref){
    final int counter = ref.watch(counterProvider);
    final counterController = ref.read(counterProvider.notifier);
    StateController btnStateController = ref.read(isResendBtnEnabledProvider.notifier);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if ( counter != 0) {
        counterController.state--;
      } else {
        btnStateController.state = true;
        counterController.state = 60;
        timer.cancel();
      }
    });

  }
}
