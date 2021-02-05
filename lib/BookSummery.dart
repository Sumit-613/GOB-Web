import 'package:flutter/material.dart';
import 'BookCover.dart';

class booksummery extends StatefulWidget {
  @override
  _booksummeryState createState() => _booksummeryState();
}

class _booksummeryState extends State<booksummery> {
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
                context, MaterialPageRoute(builder: (context) => BookCover()));
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: Container(
                height: 200,
                width: 335,
                child: Image.asset("assets/Group 286@2x.png"),
              ),
              onTap: (){},
            ),
            Container(margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                      child: Text('SUMMERY',
                          style: TextStyle(
                            color: Color(0XFFC5351A),
                            fontWeight: FontWeight.bold, fontSize: 18,fontFamily: 'bell-mt-grassetto',))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd  gubergren, no sea takimata sanctus est Lorem ipsum dolor .',
                          style: TextStyle(
                              color: Color(0XFF303030),fontFamily: 'Poppins',
                              fontSize: 13))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                      child: Text('DESCRIPTION',
                          style: TextStyle(
                            color: Color(0XFFC5351A),
                            fontWeight: FontWeight.bold,fontFamily: 'OpenSans',
                            fontSize: 15,))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd  gubergren, no sea takimata sanctus est Lorem ipsum dolor .',
                          style: TextStyle(
                              color: Color(0XFF303030),fontFamily: 'Poppins',
                              fontSize: 13))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                      child: Text('CHAPTER 1',
                          style: TextStyle(
                              color: Color(0XFFC5351A),
                              fontWeight: FontWeight.bold,fontFamily: 'OpenSans',
                              fontSize: 15))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd  gubergren, no sea takimata sanctus est Lorem ipsum dolor .',
                          style: TextStyle(
                              color: Color(0XFF303030),fontFamily: 'Poppins',
                              fontSize: 15))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
