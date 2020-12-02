import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

import 'HomePage.dart';
import 'authenticate.dart';


class BigClass extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(38,50,56,1),
        body: LoginScreen()
    );
  }
}


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String animationType = "idle";
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();
  var mno  = "458";
  var pass= "";
  final _minimumPadding = 4.0;
  TextEditingController mnomController=TextEditingController();
  TextEditingController passController=TextEditingController();
  var _formKey= GlobalKey<FormState>();
  String phoneNo, verificationId, smsCode;
  bool codeSent = false;
  bool flag1=true;

  @override
  void initState() {
    // TODO: implement initState
    passwordFocusNode.addListener((){
      if(passwordFocusNode.hasFocus){
        setState(() {
          animationType="test";
        });
      }else{
        setState(() {
          animationType="idle";
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

        //just for vertical spacing
        SizedBox(
          height: 60,
          width: 200,
        )    ,


        //space for teddy actor
        Center(
          child: Container(
              height: 300,
              width: 300,

              child: CircleAvatar(
                child: ClipOval(
                  child: new FlareActor("images/teddy_test.flr", alignment: Alignment.center, fit: BoxFit.contain, animation: animationType,),
                ),
                backgroundColor: Colors.white,
              )

          ),
        ),


        //just for vertical spacing
        SizedBox(
          height: 80,
          width: 10,
        )    ,
Container(
    height: 280,
    width: 350,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    color: Colors.white
    ),


    child:
        Form(
            key: _formKey,
            //margin: EdgeInsets.all(_minimumPadding*10),
            child:

            Column(children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: _minimumPadding*7, horizontal: 10),
                  child: TextFormField(// for taking input from the user
                      keyboardType: TextInputType.number,
                      controller: mnomController,
                      style:TextStyle(
                        fontSize: 20.0,
                        color: Colors.deepPurple[400],
                        fontWeight: FontWeight.bold,

                      ),
                      validator: (String value){
                        if(value.length!=10 || value.isEmpty)
                          return('$value is not a valid number');
                        else
                          mno=value;
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Enter mobile number',
                          labelStyle: TextStyle(
                            fontSize: 15.0,
                            fontStyle: FontStyle.italic,
                            color: Colors.indigo[300],
                          ),
                          enabled: flag1,
                          focusColor: Colors.deepPurple[200],
                          errorStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                          hintText: 'eg. 8171368898',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          )

                      ),
                      onChanged: (val) {
                        setState(() {
                          this.phoneNo = val;
                        });
                      }
                  )
              ),
              SizedBox(height: 10),
              codeSent
                  ? Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(hintText: 'Enter OTP',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )
                    ),

                    onChanged: (val) {
                      setState(() {
                        this.smsCode = val;
                      });
                    },
                  ))
                  : Container(),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: _minimumPadding*23 , right: _minimumPadding*23),
                child:
                ProgressButton.icon(iconedButtons: {
                  ButtonState.idle:
                  IconedButton(
                      text: "Login",
                      icon: Icon(Icons.send,color: Colors.white),
                      color: Colors.pink),
                  ButtonState.loading:
                  IconedButton(
                      text: "Loading",
                      color: Colors.deepPurple.shade700),
                  ButtonState.fail:
                  IconedButton(
                      text: "Failed",
                      icon: Icon(Icons.cancel,color: Colors.white),
                      color: Colors.red.shade300),
                  ButtonState.success:
                  IconedButton(
                      text: "Success",
                      icon: Icon(Icons.check_circle,color: Colors.white,),
                      color: Colors.green.shade400)
                },
                    onPressed: (){
                      // debugPrint('login pressed');
                      flag1=false;
                      codeSent
                          ? AuthService()
                          .signInWithOTP(smsCode, verificationId)
                          : verifyPhone(phoneNo);
                    },
                    state: ButtonState.idle),

              ),
            ]
            )
        ))


      ],
    );
  }
  void alertMessage(String mno) {
    var mybox = AlertDialog(
      title: Text('Login failure'),
      content: Text('$mno already exist...try again!'),
    );
    showDialog(context: context, builder: (BuildContext context) => mybox);
  }
  Future<void> verifyPhone(phoneNo) async {
    debugPrint('in the future');
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
      return Home();
    };
    final PhoneVerificationFailed verificationfailed =
        (FirebaseException authException) {
      print('${authException.message}');
    };
    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 10),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
    return Home();
  }
}