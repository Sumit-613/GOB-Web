import 'package:flutter/material.dart';
import 'package:gob_app/Model/Card_model.dart';

import 'home1.dart';
import 'MyOrder.dart';

class MyOrders extends StatelessWidget {
  List<Card_model> orders = [
    Card_model(
        imgurl: 'assets/gob-pad-belt-1000-px.png',
        title: 'GOB Lift Pad',
        duration: "On 29 Oct 2020",
        priceWithoutDiscount: "124.6",
        priceWithDiscount: "84.6",
        statusTiming: 'At 08:30 pm',
        productId: "1",
        description: 'Delivered'),
    Card_model(
        imgurl: 'gob-joint-1000-px.png',
        title: 'GOB Pre-Workout',
        duration: "On 29 Oct 2020",
        priceWithoutDiscount: "124.6",
        statusTiming: 'At 08:30 pm',
        productId: "1",
        priceWithDiscount: "84.6",
        description: 'On the way'),
    Card_model(
        imgurl: 'gob-belt-product-chart.png',
        title: 'GOB Weight Belt',
        duration: "On 29 Oct 2020",
        priceWithoutDiscount: "124.6",
        productId: "1",
        priceWithDiscount: "84.6",
        statusTiming: 'At 08:30 pm',
        description: 'Cancelled'),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Scaffold(
            appBar: AppBar(
              leading: FlatButton(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home1()));
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
            body: Container(color:Color(0XFFf0f0f0),
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.2),
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(top: 20,bottom: 20,left: MediaQuery.of(context).size.width*0.07),
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
                  child: Container(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.01),
                    color: Color(0XFFf0f0f0),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.8,
                    margin: EdgeInsets.only(left: 10),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) =>
                          orderCard(context, index),
                      itemCount: orders.length,
                    ),
                  ),
                )
              ]),
            ),
          );
        });
  }

  Widget orderCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyOrder(
                      imgurl: orders[index].imgurl,
                      title: orders[index].title,
                      status: orders[index].description,
                      date: orders[index].statusTiming,
                      productId: orders[index].productId,
                    )));
      },
      child: Container(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
        margin: EdgeInsets.only(right: 10),
        child: Card(
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                children: [
                  Image.asset(orders[index].imgurl),
                  SizedBox(
                    width: 5,
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              orders[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans-Bold'),
                            ),
                            Text(orders[index].description,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      (orders[index].description == 'Delivered')
                                          ? Color(0xFF2E7D32)
                                          : (orders[index].description ==
                                                  'On the way')
                                              ? Colors.orange
                                              : Colors.red,
                                ))
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                text: 'M.R.P:',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'OpenSans-SemiBold'),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          ' \$${orders[index].priceWithoutDiscount}',
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontFamily: 'OpenSans-SemiBold')),
                                ],
                              ),
                            ),
                            Text(
                              orders[index].duration,
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Price :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'OpenSans-SemiBold',
                                    fontWeight: FontWeight.w600),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: orders[index].priceWithDiscount,
                                      style: TextStyle(
                                          color: Color(0xFF2E7D32),
                                          fontFamily: 'Poppins-Regular',
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
