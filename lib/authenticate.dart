import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_page/HomePage.dart';
import 'package:home_page/login.dart';
class AuthService {
  //Handles Auth
  handleAuth() {
    return StreamBuilder(

        stream: FirebaseAuth.instance.authStateChanges() ,
        builder: (BuildContext context, snapshot) {
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return Home();
          }
          )
          );
          // return Home();
          // if (snapshot.hasData) {
          //   return Home();
          // } else {
          //   return Home();
          // }
        });

  }
  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }
  //SignIn
  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
    return Home();
  }
  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds = PhoneAuthProvider.credential(
        verificationId: verId, smsCode: smsCode);
    signIn(authCreds);
  }
}