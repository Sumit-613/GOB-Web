import 'package:flutter/material.dart';
import 'BookCover.dart';
import 'package:gob_app/Model/Card_model.dart';


class Terms extends StatefulWidget {
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {

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
        child: Container(padding: EdgeInsets.symmetric(horizontal: 300),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 350,
                    margin:
                    EdgeInsets.only(left: 15,  top: 10, bottom: 10),
                    child: Text(
                      'Terms and Conditions ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'OpenSans'),
                    ),
                  ),
                  Container(width: 350,
                    margin:
                    EdgeInsets.only(left: 15,   bottom: 10),
                    child: Text(
                      '(Includes Shipping and Return Policy)',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'OpenSans'),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                      child: Text('TERMS OF USE',
                          style: TextStyle(
                            color: Color(0XFFC5351A),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                          ))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                          "Welcome to our site. We provide this site to you subject to the following terms of use (“Terms”). If you visit or shop at this site, you accept these Terms. Please read them carefully.",
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontFamily: 'Poppins',
                              fontSize: 13))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                      child: Text('COPYRIGHT',
                          style: TextStyle(
                            color: Color(0XFFC5351A),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                            fontSize: 15,
                          ))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                         "All content included on this site, such as text, graphics, logos, button icons and images, is our property or the property of our content suppliers and protected by United States and international copyright laws. All software used on this site is our property or the property of our service provider or its suppliers and protected by United States and international copyright laws.",
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontFamily: 'Poppins',
                              fontSize: 13))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                      child: Text('LICENSE AND SITE ACCESS',
                          style: TextStyle(
                            color: Color(0XFFC5351A),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                            fontSize: 15,
                          ))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        "We grant you a limited license to access and make personal use of this site and not to download (other than page caching) or modify it, or any portion of it, except with our express written consent. This license does not include any resale or commercial use of this site or its contents; any collection and use of any product listings, descriptions, or prices; any derivative use of this site or its contents; any downloading or copying of account information for the benefit of another merchant; or any use of data mining, robots, or similar data gathering and extraction tools. This site or any portion of this site may not be reproduced, duplicated, copied, sold, resold, visited, or otherwise exploited for any commercial purpose without our express written consent. You may not frame or utilize framing techniques to enclose any trademark, logo, or other proprietary information (including images, text, page layout, or form) without our express written consent. You may not use any meta tags or any other “hidden text” utilizing our name or trademarks without our express written consent. Any unauthorized use terminates our permission or license.",
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontFamily: 'Poppins',
                              fontSize: 13))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),



                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget chapterSumm(
      BuildContext context, int index, List<Card_model> chapterText) {
    return Container(margin: EdgeInsets.only(left: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(top: 10, bottom: 5, ),
              child: Text(chapterText[index].title,
                  style: TextStyle(
                      color: Color(0XFFC5351A),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      fontSize: 15))),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(

              child: Text(chapterText[index].description,
                  style: TextStyle(
                      color: Color(0XFF303030),
                      fontFamily: 'Poppins',
                      fontSize: 15))),
        ],
      ),
    );
  }

  Widget descriptionBuilder(
      BuildContext context, int index, List<Card_model> description) {
    return Text(description[index].title,
        style: TextStyle(
            color: Color(0XFF303030), fontFamily: 'Poppins', fontSize: 13));
  }
}
