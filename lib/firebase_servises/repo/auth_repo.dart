import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../modules/main_event_page.dart';
import '../../modules/phone_verification_screen.dart';
import '../../utils/constants.dart';
import '../../utils/static_method.dart';
import '../controllers/auth_controller.dart';

class AuthRepo{
  /*static int? resendToken;
  static Future<bool> signInWithCredential(BuildContext context,AuthCredential authCredential) async {
    try{
      await AuthController.signInWithCredential(authCredential);
      /// here store the user in current user variable
      Navigator.pushReplacementNamed(context ,HomeScreen.routeName);
      return true;
    }
    catch(e){
      StaticMethods.showToast(Constants.invalidCodeMsg);
      return false;
    }

  }
  static Future<void> verifyPhoneNumber({required BuildContext context, required String phoneNumber}) async {
    if(phoneNumber.isNotEmpty){
      await AuthController.firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VerifyScreen(
                verificationId: verificationId,
                phoneNumber: phoneNumber,
              ),
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
    else{
      StaticMethods.showToast(Constants.enterPhoneNumber);
    }
  }
  static verifyCode(BuildContext context,String verificationId, String smsCode) async {
    if(smsCode.isNotEmpty){
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      AuthRepo.signInWithCredential(context, credential);
    }
    else{
      StaticMethods.showToast(Constants.enterTheCode);
    }
  }

  */





  static Future<bool> sendSignInWithEmailLink(String email)async{
    try{
      await AuthController.sendSignInWithEmailLink(email);
      StaticMethods.showToast(Constants.checkEmail);
      return true;
    }catch (e) {
      StaticMethods.showToast(e.toString());
      return false;
    }

  }
  static Future<bool> signInWithEmailLink(String email, String emailLink)async{
    bool validLink = AuthController.isSignInWithEmailLink(emailLink);
    if(validLink){
      try{
        await AuthController.signInWithEmailLink(email,emailLink);
        return true;
      }catch (e) {
        StaticMethods.showToast(e.toString());
        return false;
      }
    }
    print('the link is not valid');
    return false;
  }
}