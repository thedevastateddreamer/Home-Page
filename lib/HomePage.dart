import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:home_page/main_drawer.dart';
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _HomeState();
  }
}
class _HomeState extends State<Home> {
  List imageLinks = ["images/carousel1.jpg", "images/2.jpg", "images/3.jpg", "images/4.png", "images/5.jpeg", "images/6.jpg"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Bigdrawer(),
      appBar: AppBar(
          title: Text('NoQ - eliminating queues',
              style: TextStyle(
                letterSpacing: 2.0,
                fontFamily: 'Roboto Condensed',
              )),
          centerTitle: true,
          backgroundColor: Colors.indigo[200]),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              child: Card(
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Container(
                        child: CarouselSlider(
                          height: 200.0,

                          items: imageLinks.map((imageLink) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Image(
                                    image: AssetImage(imageLink),
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            );
                          }).toList(),
                          reverse:
                          false, //is false by default (reverses the order of items)
                          enableInfiniteScroll:
                          true, //is true by default (it scrolls back to item 1 after the last item)
                          autoPlay: true, //is false by default
                          initialPage:
                          0, //allows you to set the first item to be displayed
                          scrollDirection:
                          Axis.horizontal, //can be set to Axis.vertical
                          pauseAutoPlayOnTouch: Duration(
                              seconds:
                              8), //it pauses the sliding if carousel is touched,
                          onPageChanged: (int pageNumber) {
//this triggers everytime a slide changes
                          },
                          viewportFraction: 0.8,
                          enlargeCenterPage: true, //is false by default
                          aspectRatio: 16 /
                              9, //if height is not specified, then this value is used
                        )
                      /*child: Image(
                          image: AssetImage('images/carousel1.jpg'),
                          fit: BoxFit.cover),*/
                    )),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 250,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  "Check Status",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                'About Us',
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 50.0,
                    height: 90.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('images/akt.jpeg'),
                        ))),
                SizedBox(
                  width: 40,
                ),
                Container(
                    width: 50.0,
                    height: 90.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('images/divya.jpeg'),
                        ))),
                SizedBox(
                  width: 40,
                ),
                Container(
                    width: 50.0,
                    height: 90.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('images/tanuj.png'),
                        ))),
                SizedBox(
                  width: 38,
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text('Home',
              style: TextStyle(
                letterSpacing: 1.5,
                fontFamily: 'Roboto Condensed',
              )),
          backgroundColor: Colors.indigo[400]),
    );
  }
}