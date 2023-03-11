import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signInWithPhoneNumber(String phoneNumber) async {

    try {
      verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
        await _auth.signInWithCredential(phoneAuthCredential);
        return "Verification Completed";
      }

      verificationFailed(FirebaseAuthException authException) {
        return authException.message;
      }

      codeSent(String verificationId, [int? forceResendingToken]) async {
        return verificationId;
      }

      codeAutoRetrievalTimeout(String verificationId) {
        return verificationId;
      }

      await _auth.verifyPhoneNumber(
          phoneNumber: '+91$phoneNumber',
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout
      );
      return "Code Sent";
    } catch (e) {
     // Fluttertoast.showToast(msg: e.toString());
      return e.toString();
    }
  }

  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  Future<void> signOut() async {
    return _auth.signOut();
  }
}
