import 'package:flutter/material.dart';
import 'package:gob_app/components/rounded_icon_button.dart';

import 'payment.dart';

class CheckOut extends StatefulWidget {
  dynamic imgurl;
  dynamic title;
  dynamic price;
  dynamic marketPrice = 10.0;
  dynamic priceId = "";
  dynamic productId;
  int quantity;
  CheckOut(
      {this.imgurl,
      this.title,
      this.marketPrice,
      this.price,
      this.quantity,
      this.priceId,
      this.productId});
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  dynamic discount = 9.0;
  dynamic shipping = 10.0;
  dynamic tax = 8.60;
  dynamic total;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          widget.marketPrice = double.parse(widget.marketPrice);
          widget.price = double.parse(widget.price);
          this.discount = widget.marketPrice - widget.price;
          this.total =
              widget.marketPrice + this.shipping + this.tax - this.discount;
        }));
  }

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
      ),
      body: SingleChildScrollView(
          child: Container(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.23),
        margin: EdgeInsets.only(left: 10),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Text(
                    'Deliver to John: Flat no. 301/c2 ',
                    style: TextStyle(
                        color: Color(0XFF0d042b), fontFamily: 'OpenSans-Bold'),
                  )
                ],
              ),
              color: Color(0XFFf3f3f3),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  bottom: MediaQuery.of(context).size.height * 0.05),
              child: Row(
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(widget.imgurl),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          text: 'M.R.P. : ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'OpenSans-SemiBold'),
                          children: <TextSpan>[
                            TextSpan(
                                text: '\$' + widget.marketPrice.toString(),
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontFamily: 'OpenSans-SemiBold')),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Price : ',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans-SemiBold',
                              fontWeight: FontWeight.w600),
                          children: <TextSpan>[
                            TextSpan(
                                text: widget.price.toString(),
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
                                  setState(() {
                                    widget.quantity--;
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
                                  widget.quantity.toString(),
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
                                    setState(() {
                                      widget.quantity++;
                                    });
                                  })),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 20, left: 10), child: Divider()),
            Container(
                margin: EdgeInsets.only(
                    right: 20,
                    left: 10,
                    top: MediaQuery.of(context).size.height * 0.01,
                    bottom: MediaQuery.of(context).size.height * 0.01),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Apply Coupon :',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins-Regular',
                              color: Colors.grey.shade500),
                        ),
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            text: '',
                            style: TextStyle(
                                color: Colors.black26,
                                fontFamily: 'Poppins-Regular',
                                fontWeight: FontWeight.w600),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Apply  ',
                                  style: TextStyle(
                                      color: Color(0xFF2E7D32),
                                      fontFamily: 'OpenSans-SemiBold')),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      indent: 200,
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(
                  right: 20,
                  left: 10,
                  top: MediaQuery.of(context).size.height * 0.01,
                  bottom: MediaQuery.of(context).size.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sub Total :',
                    style: TextStyle(
                        fontFamily: 'OpenSans-SemiBold',
                        fontWeight: FontWeight.w600,
                        color: Color(0XFF303030)),
                  ),
                  Text(
                    '\$ ' + widget.marketPrice.toString(),
                    style: TextStyle(
                        color: Color(0xFF2E7D32),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins-Regular'),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  right: 20,
                  left: 10,
                  top: MediaQuery.of(context).size.height * 0.01,
                  bottom: MediaQuery.of(context).size.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tax & GST :',
                    style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade500),
                  ),
                  Text(
                    '\$ ' + this.tax.toString(),
                    style: TextStyle(
                        color: Color(0xFF2E7D32),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins-Regular'),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  right: 20,
                  left: 10,
                  top: MediaQuery.of(context).size.height * 0.01,
                  bottom: MediaQuery.of(context).size.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discount ',
                    style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade500),
                  ),
                  Text(
                    '-\$ ' + this.discount.toString(),
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins-Regular'),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  right: 20,
                  left: 10,
                  top: MediaQuery.of(context).size.height * 0.01,
                  bottom: MediaQuery.of(context).size.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery Charges :',
                    style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade500),
                  ),
                  Text(
                    '\$' + this.shipping.toString(),
                    style: TextStyle(
                        color: Color(0xFF2E7D32),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins-Regular'),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 10, left: 0), child: Divider()),
            Container(
              margin: EdgeInsets.only(
                  right: 20,
                  left: 10,
                  top: MediaQuery.of(context).size.height * 0.01,
                  bottom: MediaQuery.of(context).size.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Grand Total : ',
                    style: TextStyle(
                        fontFamily: 'OpenSans-Bold',
                        fontWeight: FontWeight.w600,
                        color: Color(0XFF303030)),
                  ),
                  Text(
                    '\$ ' + this.total.toString(),
                    style: TextStyle(
                      color: Color(0xFF2E7D32),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins-Regular',
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 10, left: 0), child: Divider()),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 5, ),
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
              width: double.infinity,
              child: MaterialButton(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Payment(
                             )));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
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
      )),
    );
  }
}
