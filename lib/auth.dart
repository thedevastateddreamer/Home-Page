import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_page/login.dart';
import 'package:home_page/splashScreen.dart';
import 'HomePage.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(

        stream: FirebaseAuth.instance.authStateChanges() ,
        builder: (ctx, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return SplashScreen();
          }
          else if(snapshot.hasData){
            return Home();
          }
          else{
            return BigClass();
          }
        }
        );

  }
}

