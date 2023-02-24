import 'package:events_app/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController{
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  /*static Future<UserCredential> signInWithCredential(AuthCredential authCredential){
    return firebaseAuth.signInWithCredential(authCredential);
  }
  */

  static Future<void> sendSignInWithEmailLink(String email){
    return firebaseAuth.sendSignInLinkToEmail(
      email: email,
      actionCodeSettings: ActionCodeSettings(
        url: Constants.emailLinkUrl,
        handleCodeInApp: true,
        androidPackageName: Constants.packageName,
      ),
    );
  }


  static Future<UserCredential> signInWithEmailLink(String email, String emailLink ){
    return firebaseAuth.signInWithEmailLink(email: email, emailLink: emailLink);
  }
  static bool isSignInWithEmailLink(String emailLink ){
    return firebaseAuth.isSignInWithEmailLink(emailLink);
  }

}