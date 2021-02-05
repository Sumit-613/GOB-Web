import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'addNewAddress.dart';
import 'home1.dart';
import 'list_tile.dart';
import 'paymentWebview.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool ischecked = false;
  bool addselcted = false;
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
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: 'bell-mt-grassetto',
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3,right: MediaQuery.of(context).size.width * 0.3),
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 20, bottom: 0, left: 15),
                  child: Text('DELIVERY ADDRESS',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans-SemiBold',
                          fontSize: 15))),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        addselcted = !addselcted;
                      });
                    },
                    child: Card(
                        shape: (addselcted == true)
                            ? new RoundedRectangleBorder(
                                side: new BorderSide(
                                    color: Colors.red, width: 2.0),
                                borderRadius: BorderRadius.circular(4.0))
                            : new RoundedRectangleBorder(
                                side: new BorderSide(
                                    color: Colors.white, width: 2.0),
                                borderRadius: BorderRadius.circular(4.0)),
                        child: ListTile(
                          title: Text(
                            'Address #1',
                            style: TextStyle(
                                fontFamily: 'OpenSans-SemiBold',
                                color: Color(0XFF0d042b)),
                          ),
                          subtitle: Text(
                            '4904 Goldner Ranch',
                            style: TextStyle(fontFamily: 'Poppins-Regular'),
                          ),
                          trailing: Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: (ischecked == false)
                                        ? Colors.transparent
                                        : Color(0xFF2E7D32)),
                                borderRadius: BorderRadius.circular(20)),
                            child: CircularCheckBox(
                              value: ischecked,
                              checkColor: Color(0xFF2E7D32),
                              onChanged: (newValue) {
                                setState(() {
                                  ischecked = !ischecked;
                                });
                              },
                              activeColor: Colors.white,
                            ),
                          ),
                        )),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 10, bottom: 5, left: 20),
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => AddNewAddress())
                        );
                      },
                      child: Text('+ Add New Address',
                          style: TextStyle(
                              color: Color(0XFF0d042b),
                              fontFamily: 'OpenSans-SemiBold',
                              fontWeight: FontWeight.w600,
                              fontSize: 13)))),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Container(
                  margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                  child: Text('PAYMENT METHORD',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 15))),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              List_Tile(imgurl: 'assets/Group 405.png',
                title: '**** **** **** 5967',
              ),
              List_Tile(imgurl: 'assets/social-color-1-logo-paypal.png',
                title: 'wilson.casper@bernice.info',
              ),
              List_Tile(imgurl: 'assets/Group 406.png',
                title: '**** **** **** 3461',
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              Container(
                margin:
                    EdgeInsets.only(top: 10, bottom: 5, left: 60, right: 60),
                width: double.infinity,
                child: MaterialButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  onPressed: () {

                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 10.0),
                    child: Text(
                      "Complete Payment",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans'),
                    ),
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
