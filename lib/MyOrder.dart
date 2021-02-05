import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home1.dart';
import 'MyOrders.dart';

class MyOrder extends StatelessWidget {

  dynamic imgurl;
  dynamic title;
  dynamic status;
  dynamic date;
  dynamic productId;
  MyOrder({this.imgurl, this.title, this.status,this.date, this.productId});


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
                context, MaterialPageRoute(builder: (context) => MyOrders()));
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
      body:
      Container(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.2),
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 1,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20,bottom: 20,left: MediaQuery.of(context).size.width*0.055),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Delivery Details',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black54),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.052),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Image.asset('$imgurl')),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$title',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans-Bold'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Share this item',
                                style: TextStyle(
                                    color: Color(0xFF2E7D32),
                                    fontFamily: 'Lato-Regular',
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width * 1,
                      child: Card(color: Colors.grey[100].withOpacity(1),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '$status',
                                    style: TextStyle(fontWeight: FontWeight.bold,
                                      color: ('$status'=='Delivered')?Color(0xFF2E7D32):('$status'=='On the way')?Colors.orange:Colors.red
                                        
                                        ),
                                  ),
                                  SizedBox(width: 10,),
                                  Text('$date'),
                                  SizedBox(height: 10,),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(('$status'=='Delivered')?"Package was handed to resident":('$status'=='On the way')?"Package will be handed to resident":'Order was cancelled'),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey[400])),
                                child: GestureDetector(child: Container(padding: EdgeInsets.all(5),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                    Text('Leave Delivery Feedback'),
                                    Icon(Icons.arrow_forward_ios_rounded,size: 10,)
                                  ],),
                                ),),
                              ),
                              SizedBox(height: 10,),
                              Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey[400])),
                                child: GestureDetector(child: Container(padding: EdgeInsets.all(5),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                    Text('View Item Details'),
                                    Icon(Icons.arrow_forward_ios_rounded,size: 10,)
                                  ],),
                                ),),
                              ),
                              SizedBox(height: 10,),
                              Container(decoration: BoxDecoration(border: Border.all(color: Colors.grey[400])),
                                child: GestureDetector(child: Container(padding: EdgeInsets.all(5),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                    Text('Cancel Order'),
                                    Icon(Icons.arrow_forward_ios_rounded,size: 10,)
                                  ],),
                                ),),
                              ),
                            ],
                          ),
                        ),
                      ),),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }


}
