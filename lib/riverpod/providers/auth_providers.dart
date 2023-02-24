import 'package:events_app/modules/main_event_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../modules/home_page.dart';
import '../../modules/phone_verification_screen.dart';
import '../../utils/constants.dart';
import '../../utils/static_method.dart';

final firebaseInstanceProvider = Provider((ref)=>FirebaseAuth.instance);

final firebaseAuthStateProvider = StateNotifierProvider.autoDispose<FirebaseAuthProvider,FirebaseAuth>((ref){
  final auth = ref.watch(firebaseInstanceProvider);
  return FirebaseAuthProvider(auth);
});

class FirebaseAuthProvider extends StateNotifier<FirebaseAuth>{
  FirebaseAuthProvider(super.state);
  int? resendToken;
  String? verificationId;
  String? phoneNumber;
  Future<bool> signInWithCredential(BuildContext context,AuthCredential authCredential) async {
    try{
      await state.signInWithCredential(authCredential);
      Navigator.pushReplacementNamed(context ,MainEventPage.routeName);
      return true;
    }
    catch(e){
      StaticMethods.showToast(Constants.invalidCodeMsg);
      return false;
    }

  }



  Future<void> verifyPhoneNumber({required BuildContext context, required String phoneNumber}) async {
    await state.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        this.phoneNumber = phoneNumber;
        await signInWithCredential(context,phoneAuthCredential);
      },
      verificationFailed: (FirebaseAuthException error) {
        if (error.code == Constants.invalidPhoneError) {
          StaticMethods.showToast(Constants.invalidPhoneMsg);
        }
        if (error.code == Constants.invalidCode) {
          StaticMethods.showToast(Constants.invalidCodeMsg);
        }

      },
      codeSent: (String verificationId, int? forceResendingToken){
        resendToken = forceResendingToken;
        this.phoneNumber = phoneNumber;
        this.verificationId = verificationId;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhoneVerificationPage(),
          ),
        );
      },
      forceResendingToken: resendToken,
      timeout: Constants.timeout,
      codeAutoRetrievalTimeout: (String verificationId) {
        print("Timeout................");
      },
    );

  }

  verifyCode(BuildContext context,String verificationId, String smsCode) async {
    if(smsCode.isNotEmpty){
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      signInWithCredential(context,credential);
    }
    else{
      StaticMethods.showToast(Constants.enterTheCode);
    }
  }

  User? getCurrentUser(){
    return state.currentUser;
  }
  checkUserIsLogin(){
    getCurrentUser()!=null?const MainEventPage(): const HomePage();
  }
  void signOut(BuildContext context) async{
    state.signOut();
    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }

}