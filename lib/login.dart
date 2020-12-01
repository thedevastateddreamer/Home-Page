import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_page/authenticate.dart';
import 'package:home_page/HomePage.dart';

class Bigclass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SmallClass();
  }
}
class _SmallClass extends State<Bigclass> {
  // this will define the state of our widget bigclass
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
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Form(
            key: _formKey,
            //margin: EdgeInsets.all(_minimumPadding*10),
            child: ListView(children: <Widget>[
              getImageAsset(),
              Padding(
                  padding: EdgeInsets.only(bottom: _minimumPadding*7),
                  child: TextFormField(// for taking input from the user
                    keyboardType: TextInputType.number,
                    controller: mnomController,
                    style:TextStyle(
                      fontSize: 20.0,
                      color: Colors.green,
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
                          color: Colors.greenAccent,
                        ),
                        enabled: flag1,
                        focusColor: Colors.greenAccent,
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
              codeSent
                  ? Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(hintText: 'Enter OTP'),
                    onChanged: (val) {
                      setState(() {
                        this.smsCode = val;
                      });
                    },
                  ))
                  : Container(),
              Padding(
                  padding: EdgeInsets.only(left: _minimumPadding*23 , right: _minimumPadding*23),
                  child: RaisedButton(// for taking input from the user
                      elevation: 6.0,
                      color: Colors.greenAccent,

                      child: codeSent?(Text(
                        'Verify',
                        style:TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,

                        ),

                      ))

                      :Text(
                        'Login',
                        style:TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,

                        ),

                      ),
                      onPressed: (){
                        // debugPrint('login pressed');
                        flag1=false;
                        codeSent
                            ? AuthService()
                            .signInWithOTP(smsCode, verificationId)
                            : verifyPhone(phoneNo);
                      },
                      )
              ),
            ]
            )
        )
    );
  }
  Widget getImageAsset(){
    AssetImage assetImage=AssetImage('images/monkey.gif');
    Image image=Image(image: assetImage,width:125.0, height: 125.0,);
    return Container(
      child: image,margin: EdgeInsets.all(_minimumPadding*10),
    );
  }
  void alertMessage(String mno) {
    var mybox = AlertDialog(
      title: Text('Login failure'),
      content: Text('$mno aleready exist...try again!'),
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
