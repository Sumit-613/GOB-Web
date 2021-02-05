import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home1.dart';
import 'BookSummery.dart';

class BookCover extends StatefulWidget {
  @override
  _BookCoverState createState() => _BookCoverState();
}

class _BookCoverState extends State<BookCover> {
  bool isbookbought = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home1()));
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
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18,fontFamily: 'bell-mt-grassetto',),
        ),
        centerTitle: true,
        actions: [
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
        child: Center(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 480,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/Image 35.png')),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'COURSE BY CHARLES GLASS',
                  style: TextStyle(
                      color: Color(0XFF0d042b),
                      fontWeight: FontWeight.bold,fontFamily: 'OpenSans',
                      fontSize: 20),
                ),
                Container(width: 300,
                    margin: EdgeInsets.symmetric(vertical: 20,),
                    child: !isbookbought
                        ? Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Container(
                          width: 120,
                          child: RaisedButton(
                            onPressed: () {},
                            child: Text(
                              'Enroll',
                              style: TextStyle(color: Colors.white,fontFamily: 'OpenSans',),
                            ),
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(width: 120,
                          child: RaisedButton(
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>booksummery()));
                            },
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              'Learn More',
                              style: TextStyle(color: Colors.red,fontFamily: 'OpenSans',),
                            ),
                          ),
                        ),
                      ],
                    )
                        : RaisedButton(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),),
                      onPressed: () {},
                      child: Container(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                        child: Text(
                          'Continue Reading',
                          style: TextStyle(color: Colors.white,fontFamily: 'OpenSans',),
                        ),
                      ),
                    )),
              ],
            )),
      ),
    );
  }
}
