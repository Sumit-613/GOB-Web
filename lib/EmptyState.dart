import 'package:flutter/material.dart';
import 'package:gob_app/Model/Card_model.dart';
import 'package:gob_app/components/rounded_icon_button.dart';

class EmptyState extends StatefulWidget {
  @override
  _EmptyStateState createState() => _EmptyStateState();
}

class _EmptyStateState extends State<EmptyState> {
  bool isAddedToCart = true;

  List<Card_model> addedtoCart = [
    Card_model(
        imgurl: "gob-belt-product-chart.png",
        title: "Loading...",
        priceWithoutDiscount: "145.6",
        priceWithDiscount: "84.6",
        countAdded: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0XFF5C161B), Color(0XFFC5351A)])),
              ),
              title: Text(
                'Charles Glass',
                style: TextStyle(
                    fontFamily: 'Poppins-Light',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
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
            body: (isAddedToCart == false)
                ? Container(padding: EdgeInsets.symmetric(horizontal: 300),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Column(
                        children: [
                          Container(child: Image.asset('assets/Empty.png')),
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 35),
                              child: Text(
                                'Your Cart is Empty.',
                                style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    color: Colors.grey),
                              )),
                          Container(
                            margin: EdgeInsets.only(
                                top: 10, bottom: 5, left: 60, right: 60),
                            width: double.infinity,
                            child: MaterialButton(
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0)),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 10.0),
                                child: Text(
                                  "Check Our Products",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans'),
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            )
                : Container(padding: EdgeInsets.symmetric(horizontal: 300),
              color: Color(0XFFf0f0f0),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              margin: EdgeInsets.only(left: 5, top: 20),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) =>
                    added(context, index),
                itemCount: addedtoCart.length,
              ),
            ),
          );
        });
  }

  Widget added(BuildContext context, int index) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Card(
              child: Row(
                children: [
                  Image.asset(addedtoCart[index].imgurl),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        addedtoCart[index].title,
                        style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Price :',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans-SemiBold',
                              fontWeight: FontWeight.w600),
                          children: <TextSpan>[
                            TextSpan(
                                text: addedtoCart[index].priceWithDiscount,
                                style: TextStyle(
                                    color: Color(0xFF2E7D32),
                                    fontFamily: 'Poppins-Regular',
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 23,
                            child: RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() async {


                                  });
                                }),
                          ),
                          Container(
                              width: 23,
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                border:
                                Border.all(width: 1, color: Colors.grey),
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Center(
                                child: Text(
                                  addedtoCart[index].countAdded.toString(),
                                  style: TextStyle(
                                    color: Color(0xFF2E7D32),
                                  ),
                                ),
                              )),
                          Container(
                              width: 23,
                              child: RoundIconButton(
                                  icon: Icons.add,
                                  onPressed: () {
                                    setState(() async {

                                    });
                                  })),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
