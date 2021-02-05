import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './Model/Card_model.dart';

class Coupons extends StatefulWidget {
  Coupons() : super();

  final String title = "Carousel Demo";

  @override
  CouponsState createState() => CouponsState();
}

class CouponsState extends State<Coupons> {

  CarouselSlider carouselSlider;
  int _current = 0;
  List<Card_model> cards=[
    Card_model(priceWithDiscount: '\$ 10.55',
        audio: false,
        video: false,
        textual: true
    ),
    Card_model(priceWithDiscount: '\$ 20.55',
        audio: true,
        video: false,
        textual: true
    ),
    Card_model(priceWithDiscount: '\$ 49.55',
        audio: true,
        video: true,
        textual: true
    ),
  ];


  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {

    List _kTabPages = <Widget>[
      Card(
          elevation: 10,
          shape: new RoundedRectangleBorder(
              side: new BorderSide(
                  color:
                  (_current == 0) ? Colors.redAccent : Colors.transparent,
                  width: 2.0),
              borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            width: 500,
            height: 15.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  cards[0].priceWithDiscount,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      fontSize: 30),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 150,
                  child: Text(
                    "PROGRAM FOR TRAINING",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0XFF051c3f),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Image.asset('assets/Group 319.png'),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Goal based workouts',style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Image.asset('assets/Group 319.png'),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Build custom plan',style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Image.asset('assets/Group 319.png'),
                    SizedBox(
                      width: 15,
                    ),
                    Container(width:MediaQuery.of(context).size.width*0.2,child: Text('Beginner,Intermediate and advance plan to follow',style: TextStyle(fontWeight: FontWeight.bold),)),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                RaisedButton(
                  padding:
                  EdgeInsets.only(left: 60, right: 60, top: 15, bottom: 15),
                  onPressed: () async { },
                  child: Text(
                    'Get Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          )),
      Card(
          elevation: 10,
          shape: new RoundedRectangleBorder(
              side: new BorderSide(
                  color:
                  (_current == 1) ? Colors.redAccent : Colors.transparent,
                  width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            width: 500,
            height: 15.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  cards[1].priceWithDiscount,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      fontSize: 30),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 200,
                  child: Text(
                    "LIFE TIME ACCESS COURSE OF CHARLES GLASS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0XFF051c3f),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Image.asset('assets/Group 319.png'),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Audio Book Charles Glass',style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Image.asset('assets/Group 319.png'),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Video Book By Charles Glass',style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Image.asset('assets/Group 319.png'),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Textual Copy Of The Book',style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                RaisedButton(
                  padding:
                  EdgeInsets.only(left: 60, right: 60, top: 15, bottom: 15),
                  onPressed: () async { },
                  child: Text(
                    'Get Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          )),
      Card(
          elevation: 10,
          shape: new RoundedRectangleBorder(
              side: new BorderSide(
                  color:
                  (_current == 2) ? Colors.redAccent : Colors.transparent,
                  width: 2.0),
              borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            width: 500,
            height: 15.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  cards[2].priceWithDiscount,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      fontSize: 30),
                ),
                SizedBox(
                  height: 12.5,
                ),
                Container(
                  width: 200,
                  child: Text(
                    "COURSE AND YEARLY MEMBERSHIP",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0XFF051c3f),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 12.5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Image.asset('assets/Group 319.png'),
                    SizedBox(
                      width: 15,
                    ),
                    Container(width:MediaQuery.of(context).size.width*0.2,child: Text('Free Lifetime Access Of Course By Charles Glass',style: TextStyle(fontWeight: FontWeight.bold),)),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text("+",style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 5,
                ),

                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Image.asset('assets/Group 319.png'),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Goal based workouts',style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Image.asset('assets/Group 319.png'),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Build custom plan',style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Image.asset('assets/Group 319.png'),
                    SizedBox(
                      width: 15,
                    ),
                    Container(width:MediaQuery.of(context).size.width*0.2,child: Text('Beginner,Intermediate and advance plan to follow',style: TextStyle(fontWeight: FontWeight.bold),)),
                  ],
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                RaisedButton(
                  padding:
                  EdgeInsets.only(left: 60, right: 60, top: 15, bottom: 15),
                  onPressed: () async { },
                  child: Text(
                    'Get Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          )),

    ];

    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0XFF5C161B), Color(0XFFC5351A)])),
        ),
        title: Text(
          'Charles Glass',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'bell-mt-grassetto',
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
              width: MediaQuery.of(context).size.width * 0.05,
              child: FlatButton(
                  onPressed: null,
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ))),
          FlatButton(
              onPressed: null,
              child: Stack(
                children: [
                  Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                  ),
                  Positioned(
                      right: 5,
                      top: 5,
                      child: new Container(
                          padding: EdgeInsets.all(3),
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          )))
                ],
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1,right: MediaQuery.of(context).size.width * 0.1),

//          width: MediaQuery.of(context).size.width*0.4,
//          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Text("SUBSCRIPTION PLANS",textAlign: TextAlign.center, style:
              TextStyle( color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'OpenSans',
                  fontSize: 15),),
              SizedBox(
                height: 50,
              ),
              carouselSlider = CarouselSlider(
                height: 500.0,

                viewportFraction: 0.33,
                initialPage: 0,
                enlargeCenterPage: true,
                autoPlay: true,
                reverse: true,
                enableInfiniteScroll: true,
                autoPlayInterval: Duration(seconds: 10),
                autoPlayAnimationDuration: Duration(milliseconds: 4000),
                pauseAutoPlayOnTouch: Duration(seconds: 10),
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  setState(() {
                    _current = index;
                  });
                },
                items:  _kTabPages,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(_kTabPages, (index, url) {
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey),
                      color: _current == index ? Colors.redAccent : null,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}