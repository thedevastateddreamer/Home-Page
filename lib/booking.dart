
/*import 'package:flutter/material.dart';

void main() => runApp(new Anything());

class Anything extends StatelessWidget {
// This widget is the root of your application.
@override
Widget build(BuildContext context) {
return new MaterialApp(
title: 'Flutter Demo',
theme: new ThemeData(
    Widget build(BuildContext context) {

  return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(38,50,56,1),
  );
}
}

class MyHomePage extends StatefulWidget {

@override
_MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
int _counter = 0;

void _incrementCounter() {
setState(() {

_counter++;
});
}

@override
Widget build(BuildContext context) {

return new Scaffold(
appBar: new AppBar(
// Here we take the value from the MyHomePage object that was created by
// the App.build method, and use it to set our appbar title.
),
body: new Center(

child: new Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    new Text(
      "Element 1",
    ),
    new Text(
        "Element 2"
    ),
    new Text(
        "Element 3"
    ),
  ],
// horizontal).
// new Text(
),
),
);
}
}*/


import 'package:flutter/material.dart';
import 'package:home_page/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:home_page/providers/token.dart';

//import 'HomePage.dart';

class Anything extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Token token = Provider.of<Token>(context);
    return Scaffold(
        appBar: AppBar(
            title: Text('NoQ - eliminating queues',
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontFamily: 'Roboto Condensed',
                )),
            centerTitle: true,
            backgroundColor: Colors.deepPurple[300]),
        body:
        Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child:
                    Text(
                      '${token.tokenNo}',
                      style: TextStyle(fontSize: 200,
                      fontFamily: 'Roboto Condensed',
                        color: Colors.blueGrey[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 3.0
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(5.0) //                 <--- border radius here
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              new Text(
                "Your Token",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
              SizedBox(
                height: 35
                ,
              ),
              new Text(
                "Hey! Keep an eye on the ticket calls!",
                style: TextStyle(fontSize: 25,),
              ),
              SizedBox(
                height: 40
              ),
             Container(
               width: 215,
               height: 30,
               child: RaisedButton(
                 onPressed: () {},
                 color: Theme.of(context).backgroundColor,
                   child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: <Widget>[
                     Text(
                       'Turn on notifications',
                       style: TextStyle(
                         fontSize: 15,
                         fontWeight: FontWeight.w700,
                         color: Colors.white,
                       ),
                     ),
                     Icon(
                       Icons.notifications_active,
                       color: Colors.white,
                     )
                   ],
                 ),
               ),
             ),
              SizedBox(
                height: 40
              ),
              new Text(
                'Created with ❤ ️by DAT',
                maxLines: 1,
                  style: TextStyle(fontSize: 21, color: Colors.black),
              ),
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()
            )
            );
          },
          child: Text('Home',
              style: TextStyle(
                letterSpacing: 1.5,
                fontFamily: 'Roboto Condensed',
              )),
          backgroundColor: Colors.indigo[400]),
    );
  }
}