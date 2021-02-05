import 'package:flutter/material.dart';
import 'home1.dart';
import 'package:gob_app/Model/Card_model.dart';
class ProductGrid extends StatefulWidget {
  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  final List<Card_model> products = [
    Card_model(
        imgurl: 'assets/gob-pad-belt-1000-px.png',
        title: 'GOB Lift Pad',
        duration: "\$84.6 /-"),
    Card_model(
        imgurl: 'gob-joint-1000-px.png',
        title: 'GOB Pre-Workout',
        duration: '\$ 32.6 /-'),
    Card_model(
        imgurl: 'gob-belt-product-chart.png',
        title: 'GOB Weight Belt',
        duration: '\$ 84.6 /-'),
  ];
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
      body: Container(
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3,right: MediaQuery.of(context).size.width * 0.3),
        child: Stack(
        children: [
          Container(width: MediaQuery.of(context).size.width*1,
            margin: EdgeInsets.only(top: 50,left: 5,right: 5),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height /0.7),
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 4.0),
              itemBuilder: (BuildContext context, int index) =>
                  productsCard(context, index),
              itemCount: products.length,
            ),
          ),
          Positioned(
            child: Text(
              'Products By GOB',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: 'OpenSans'),
            ),
            top: 20,
            left: 10,
          )
        ],
      ),)
    );
  }

  Widget productsCard(BuildContext context, int index) {
    return Container(height: MediaQuery.of(context).size.height*0.4,
      child: Card(
        elevation: 5,
        shape:
        new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
        child:  Column(
          children: [
            Container(
              height: 100,
              width: 150,
              child: Image.asset(
                products[index].imgurl,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              products[index].title,
              style: TextStyle(fontFamily: 'OpenSans-Bold'),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  products[index].duration,
                  style: TextStyle(
                      color:  Color(0xFF2E7D32),
                      fontFamily: 'Lato-Regular',
                      fontWeight: FontWeight.bold),
                )),
            Container(
              height: 22,
              width: 65,
              child: RaisedButton(
                onPressed: () {

                },
                child: Text(
                  'Get Now',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 7,
                      fontFamily: 'OpenSans-SemiBold'),
                ),
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ),
              ),
            ),
          ],
        ),),
    );

  }

}


