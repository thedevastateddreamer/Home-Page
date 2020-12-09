import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Settingss.dart';
import 'auth.dart';
import 'package:http/http.dart' as http;
import  'dart:convert';
import 'package:provider/provider.dart';
import 'package:home_page/providers/token.dart';
import 'package:show_up_animation/show_up_animation.dart';
class Bigdrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MainDrawer();
  }
}
class MainDrawer extends State<Bigdrawer> {

  @override
  String greetings = '';
  dynamic ans;
  bool flag=true;
  String a ='';
  Widget build(BuildContext context) {
    Token token = Provider.of<Token>(context);
    return Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.all(0.0),
          children: <Widget>[
            new Container(
              child: new DrawerHeader(
                child: new CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: ClipOval(
                    child: Image.network(
                      "https://lh3.googleusercontent.com/fr7iBUCXzCLWmMa0bU6FOOBGxbL9h6TinmtdByeJmgfEBkQ0LU5eGw7gt0p6CJMNpi92",
                      width: 100,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              color: Colors.indigo[200],
            ),
            ExpansionTile(
              leading: Icon(Icons.category),
              title: Text("Categories"),
              children: <Widget>[
                ListTile(
                  title: Text('All'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Hospitals'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Stores'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Banks'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.add_circle_outline),
              title: Text('Book now'),

              onTap: () async{
                if(token.tokenNo ==0)
                {
                  // token.updateToken(token.tokenNo + 1);
                  final response = await http.get('http://127.0.0.1:5000/'); //getting the response from our backend server script
                  final decoded = json.decode(response.body) as Map<String, dynamic>; //converting it from json to key value pair
                  a=decoded['count'];
                  token.tokenNo=int.parse(a);
                  Timer.periodic(new Duration(seconds: 20), (timer) async {
                    print('Success!');
                    if(token.tokenNo > 0){
                      token.updateToken(token.tokenNo - 1);
                    }
                  });
                  setState(() {
                    greetings = 'Your ticket has been booked!';
                    //greetings = decoded['greetings']; //changing the state of our widget on data update
                  }
                  );
                }
                else{
                  setState(() {
                    if(flag)
                    greetings = 'Already booked..check status!';
                    else
                    greetings = 'One user, one token..xd';
                    flag=!flag;
                  }
                  );
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Register Yourself'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Auth()
                )
                );
                // Navigator.push(context, MaterialPageRoute(builder: (context){
                //  return Bigclass();
                //}
                //)
                //);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sign Out'),
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
            ),
            ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return SettingsOnePage();
                  }
                  )
                  );
                }
            ),
            ShowUpAnimation(
              delayStart: Duration(seconds: 1),
              animationDuration: Duration(seconds: 1),
              curve: Curves.bounceIn,
              direction: Direction.vertical,
              offset: 0.5,
              child: ListTile(
                  leading: Icon(Icons.check_circle_outline),
                  title: Text(greetings),
                  focusColor: Colors.green,
                  onTap: () {
                  },
                )
            ),
            // ListTile(
            //   leading: Icon(Icons.add_alert),
            //   title: Text('Add more people in the Queue?'),
            //   onTap: () async{
            //     Timer.periodic(new Duration(seconds: 10), (timer) async {
            //       print('Success!');
            //       if(token.tokenNo > 0){
            //         token.updateToken(token.tokenNo - 1);
            //       }
            //     });
            //   },
            // ),
          ],
        ));
  }
}