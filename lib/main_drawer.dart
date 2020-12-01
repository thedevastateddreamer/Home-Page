import 'package:flutter/material.dart';
import 'package:home_page/login.dart';

class Bigdrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MainDrawer();
  }
}
class MainDrawer extends State<Bigdrawer> {
  @override
  Widget build(BuildContext context) {
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
              leading: Icon(Icons.check_circle_outline),
              title: Text('Check Status'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.format_align_justify),
              title: Text('Register Your Business'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Contact Us'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer

              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Bigclass();
                  }
                  )
                  );
                  //setState(() {
                  //if(_formKey.currentState.validate())
                  //alertMessage(mno);


                  //});
                }
                // Update the state of the app
                // ...
                // Then close the drawer
                // Navigator.pop(context);
            ),
          ],
        ));
  }
}
