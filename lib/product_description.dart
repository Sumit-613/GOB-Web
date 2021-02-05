import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'EmptyState.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:gob_app/components/rounded_icon_button.dart';
//import 'checkOut.dart';
import 'package:gob_app/Model/Card_model.dart';
//import 'package:gob_app/components/constants.dart';

import 'EmptyState.dart';
import 'checkOut.dart';
import 'constants.dart';
import 'payment m 2.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProductDescriptionPage extends StatefulWidget {
  int index;
  dynamic imgurl;
  dynamic title;
  dynamic price;
  ProductDescriptionPage({this.imgurl, this.title, this.price, this.index});
  @override
  _ProductDescriptionPageState createState() => _ProductDescriptionPageState();
}

final List<Card_model> Comments = [
  Card_model(
    imgurl: 'assets/Symbol 216 – 28.png',
    title: 'Linda Doe',
    duration: '3 reply',
    description:
    'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ',
  ),
  Card_model(
    imgurl: 'assets/Symbol 216 – 28.png',
    title: 'John Doe',
    duration: '3 reply',
    description:
    'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  ),
  Card_model(
    imgurl: 'assets/Symbol 216 – 28.png',
    title: 'John Doe',
    duration: '3 reply',
    description:
    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor.Lorem ips dolor sit amet.',
  ),
];
List<Card_model> products = [
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

List<Card_model> productsindex1 = [
  Card_model(
      imgurl: 'gob-joint-1000-px.png',
      title: 'GOB Pre-Workout',
      duration: '\$ 32.6 /-'),
  Card_model(
      imgurl: 'gob-belt-product-chart.png',
      title: 'GOB Weight Belt',
      duration: '\$ 84.6 /-'),
];
List<Card_model> productsindex2 = [
  Card_model(
      imgurl: 'assets/gob-pad-belt-1000-px.png',
      title: 'GOB Lift Pad',
      duration: "\$84.6 /-"),
  Card_model(
      imgurl: 'gob-belt-product-chart.png',
      title: 'GOB Weight Belt',
      duration: '\$ 84.6 /-'),
];
List<Card_model> productsindex3 = [
  Card_model(
      imgurl: 'assets/gob-pad-belt-1000-px.png',
      title: 'GOB Lift Pad',
      duration: "\$84.6 /-"),
  Card_model(
      imgurl: 'gob-joint-1000-px.png',
      title: 'GOB Pre-Workout',
      duration: '\$ 32.6 /-'),
];

class _ProductDescriptionPageState extends State<ProductDescriptionPage> {
  String videoURL = "https://www.youtube.com/watch?v=n8X9_MgEdCg";
  int sel=1;
  int quantity=1;

  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL)
    );

    super.initState();
  }
  @override
  void dispose() {
    _controller.pause();
    super.dispose();
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
        actions: [
          Container(
              width: MediaQuery.of(context).size.width * 0.05,
              child: FlatButton(
                  onPressed: (){
//                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EmptyState()));
                  },
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
          width: MediaQuery.of(context).size.height * 0.9,
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3,right: MediaQuery.of(context).size.width * 0.18),
          child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0XFFf4f4f4),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.32,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.imgurl),
                            fit: BoxFit.fill)),
                  ),
                  Container(
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            height: 50,
                            width: 50,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  sel=1;

                                });
                              },
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      side:(sel==1)? new BorderSide(
                                          color: Colors.red, width: 2.0):new BorderSide(
                                          color: Colors.transparent, width: 2.0),
                                      borderRadius: BorderRadius.circular(4.0)),
                                  margin: EdgeInsets.all(1),
                                  child: Container(
                                      child: Image.asset(
                                          'assets/gob-pad-belt-1000-px.png'))),
                            )),
                        Container(
                            height: 50,
                            width: 50,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {sel=2;});
                              },
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      side:(sel==2)? new BorderSide(
                                          color: Colors.red, width: 2.0):new BorderSide(
                                          color: Colors.transparent, width: 2.0),
                                      borderRadius: BorderRadius.circular(4.0)),
                                  margin: EdgeInsets.all(1),
                                  child: Container(
                                      child: Image.asset(
                                          'assets/gob-pad-belt-1000-px.png'))),
                            )),
                        Container(
                            height: 50,
                            width: 50,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {sel=3;});
                              },
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      side:(sel==3)? new BorderSide(
                                          color: Colors.red, width: 2.0):new BorderSide(
                                          color: Colors.transparent, width: 2.0),
                                      borderRadius: BorderRadius.circular(4.0)),
                                  margin: EdgeInsets.all(1),
                                  child: Container(
                                      child: Image.asset(
                                          'assets/gob-pad-belt-1000-px.png'))),
                            )),
                        Container(
                            height: 50,
                            width: 50,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {sel=4;});
                              },
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      side:(sel==4)? new BorderSide(
                                          color: Colors.red, width: 2.0):new BorderSide(
                                          color: Colors.transparent, width: 2.0),
                                      borderRadius: BorderRadius.circular(4.0)),
                                  margin: EdgeInsets.all(1),
                                  child: Container(
                                      child: Image.asset(
                                          'assets/gob-pad-belt-1000-px.png'))),
                            )),
                        Container(
                            height: 50,
                            width: 50,

                            // decoration: BoxDecoration(color: Colors.grey)

                            margin: EdgeInsets.symmetric(horizontal: 5),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {});
                              },
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      side: new BorderSide(
                                        color: Colors.grey[600],
                                      ),
                                      borderRadius: BorderRadius.circular(6.0)),

                                  child: Container(
                                      decoration:
                                      BoxDecoration(color: Colors.grey),
                                      child: Center(
                                          child: Text(
                                            '+3',
                                          )))),
                            )),
                      ],
                    ),
                  )
                ],
              ),
//              /* add child content here */
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                    margin: EdgeInsets.only(
                        top: 10, bottom: 10, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.title,
                            style: TextStyle(
                              color: Color(0XFF303030),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'Montserrat-Bold',
                            )),
                        SmoothStarRating(
                          rating: 4.5,
                          starCount: 5,
                          isReadOnly: true,
                          color: Color(0xFF2E7D32),
                          borderColor: Colors.white,
                        )
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(
                        top: 10, bottom: 10, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'M.R.P. :',
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'OpenSans-SemiBold'),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' \$ 124.6',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontFamily: 'OpenSans-SemiBold')),
                            ],
                          ),
                        ),
                        Text(
                          '2k Ratings & Reviews',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.grey[500]),
                        )
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
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
                                  text: widget.price,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0XFF23a455),
                                      fontSize: 15)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Quantity :',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'OpenSans-SemiBold',
                                  fontWeight: FontWeight.w600),
                            ),
                            RoundIconButton(
                                icon: Icons.remove, onPressed: (){setState(() {
                              quantity--;
                            });}),
                            Container(
                                decoration: BoxDecoration(
                                  border:
                                  Border.all(width: 1, color: Colors.grey),
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Center(
                                  child: Text(
                                    quantity.toString(),
                                    style: TextStyle(color: Color(0xFF2E7D32),),
                                  ),
                                )),
                            RoundIconButton(icon: Icons.add, onPressed: (){setState(() {
                              quantity++;
                            });}),
                          ],
                        )
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                        'Do you wish you could recruit more fibers when you lift?  Do you wish you could modify some of the equipment at the gym so you feel the muscles you are targeting work a little more? Then you do not want to miss the opportunity to buy a GOB weight training pad.  By utilizing his experience as an engineer, this pad was specifically designed by Charles Glass so you could attach it to various machines at the gym.  Once attached, you can manipulate the angles of your body to recruit the targeted muscles more easily.  This pad is light weight and can easily fit into a gym bag.  The attached straps allow you to wrap it around a machine or bench to your liking so you can use it while training alone.  Do not miss this opportunity to use one of Charles Glass’ secrets to make your training sessions more successful.',
                        style: TextStyle(
                            color: Color(0XFF303030),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: 12))),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: RaisedButton(
                        onPressed: () {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CheckOut(quantity: quantity,
                                    imgurl: widget.imgurl,
                                    title: widget.title,
                                    price: widget.price,
                                  )));
                          dispose();
                        },
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold),
                        ),
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EmptyState()));
                        },
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          'Add To Cart',
                          style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Container(
                    margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                    child: Text('COMING UP NEXT',
                        style: TextStyle(
                            color: Color(0XFF303030),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                            fontSize: 15))),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                    width: double.infinity,
                    height: 180,
                    margin: EdgeInsets.only(left: 10),
                    child: (widget.index == 0)
                        ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) =>
                          productsCard(context, index),
                      itemCount: productsindex1.length,
                    )
                        : (widget.index == 1)
                        ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder:
                          (BuildContext context, int index) =>
                          productsCard2(context, index),
                      itemCount: productsindex2.length,
                    )
                        : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder:
                          (BuildContext context, int index) =>
                          productsCard3(context, index),
                      itemCount: productsindex3.length,
                    )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DESCRIPTION',
                        style: TextStyle(
                            color: Color(0XFF0d042b),
                            fontFamily: 'OpenSans',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.018,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. Atvero eos et accusam et justo duo dolores et ea rebum.',
                          style: TextStyle(
                              fontFamily: 'Poppins-Regular',
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.018,
                      ),
                      Container(
                        child: YoutubePlayer(
                          controller: _controller,
                          showVideoProgressIndicator: true,
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                    margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                    child: Text('ADD YOUR COMMENTS HERE',
                        style: TextStyle(
                            color: Color(0XFF303030),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                            fontSize: 15))),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    textAlign: TextAlign.start,
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
//                          email = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send,
                          color: Colors.red,
                        ),
                      ),
                      hintText: 'Type Something',
                      hintStyle: TextStyle(),
                      fillColor: Color(0x1F000000),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                    margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                    child: Text('PREVIOUS COMMENTS',
                        style: TextStyle(
                            color: Color(0XFF303030),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                            fontSize: 15))),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                  color: Color(0x8AFFFFFF),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.55,
//                  margin: EdgeInsets.only(left: 10),
                  child: ListView.builder(physics: NeverScrollableScrollPhysics(),

                    itemBuilder: (BuildContext context, int index) =>
                        Comment(context, index),
                    itemCount: 2,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Center(
                  child: MaterialButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    onPressed: () {
                      showModalBottomSheet(isScrollControlled: true,
                          context: context,
                          builder: (builder) {
                            return new Container(
                              height: MediaQuery.of(context).size.height * 2,
                              width: double.infinity,

                              color: Color(
                                  0x8A000000), //could change this to Color(0xFF737373),
                              //so you don't have to change MaterialApp canvasColor
                              child: new Container(
                                decoration: new BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: new BorderRadius.only(
                                        topLeft: const Radius.circular(20.0),
                                        topRight: const Radius.circular(20.0))),
                                child: Container(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.2),
                                  color: Color(0x8AFFFFFF),
                                  width: double.infinity,
                                  height:
                                  MediaQuery.of(context).size.height * 0.5,
//                  margin: EdgeInsets.only(left: 10),
                                  child: Stack(
                                    children: [
                                      Container(margin: EdgeInsets.only(top: 100),
                                        child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemBuilder:
                                              (BuildContext context, int index) =>
                                              Comment(context, index),
                                          itemCount: Comments.length,
                                        ),
                                      ),
                                      Positioned(top: 50,left: MediaQuery.of(context).size.width*0.55,child: IconButton(icon: Icon(Icons.cancel),onPressed: (){Navigator.pop(context);},),),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        "See more Comments",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              ],
            ),
          ],
        ),),
      ),
    );
  }

  Widget Comment(BuildContext context, int index) {
    return Container(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [CircleAvatar(
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    Comments[index].imgurl,
                  ),
                ),
                radius: 42,
                backgroundColor: Colors.white,
              ),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.005,
                ),
                Container(
                  width: MediaQuery.of(context).size.height * 0.28,
                  child: Text(Comments[index].title,
                      style: TextStyle(
                          color: Color(0XFF303030),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 15)),
                ),
              ],),

              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Container(
//              margin: EdgeInsets.symmetric(vertical: 5),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                Comments[index].description,
                style: TextStyle(fontSize: 12, height: 1.8),
              )),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Row(
            children: [
              Container(
                width: 60,
                child: FlatButton(
                  onPressed: () {},
                  padding: EdgeInsets.only(left: 10, top: 7),
                  child: Text('Reply',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        decoration: TextDecoration.underline,
                      )),
                ),
              ),

              Text(
                '| ',
                style: TextStyle(fontSize: 12, color: Colors.grey, height: 1.8),
              ),
              Text(
                Comments[index].duration,
                style: TextStyle(fontSize: 12, height: 1.8),
              ),
//              Container(
////              margin: EdgeInsets.symmetric(vertical: 5),
//                  child: Text(
//                    Comments[index].duration,
//                    style: TextStyle(fontSize: 12, height: 1.8),
//                  )),
              Divider(),
            ],
          ),
          Divider(indent: 15,endIndent: 15,),
        ],
      ),
    );
  }

  Widget productsCard(BuildContext context, int index) {
    return Card(
        elevation: 5,
        shape:
        new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          width: 150,
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: 150,
                child: Image.asset(
                  productsindex1[index].imgurl,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                productsindex1[index].title,
                style: TextStyle(fontFamily: 'OpenSans-Bold'),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    productsindex1[index].duration,
                    style: TextStyle(
                        color:Color(0xFF2E7D32),
                        fontFamily: 'Lato-Regular',
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                height: 22,
                width: 65,
                child: RaisedButton(
                  onPressed: () {},
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
          ),
        ));
  }

  Widget productsCard2(BuildContext context, int index) {
    return Card(
        elevation: 5,
        shape:
        new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          width: 150,
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: 150,
                child: Image.asset(
                  productsindex2[index].imgurl,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                productsindex2[index].title,
                style: TextStyle(fontFamily: 'OpenSans-Bold'),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    productsindex2[index].duration,
                    style: TextStyle(
                        color:Color(0xFF2E7D32),
                        fontFamily: 'Lato-Regular',
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                height: 22,
                width: 60,
                child: RaisedButton(
                  onPressed: () {},
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
          ),
        )) ;
  }

  Widget productsCard3(BuildContext context, int index) {
    return Card(
      elevation: 5,
      shape:
      new RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)),
      child:Container(
        width: 150,
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 150,
              child: Image.asset(
                productsindex3[index].imgurl,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              productsindex3[index].title,
              style: TextStyle(fontFamily: 'OpenSans-Bold'),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  productsindex3[index].duration,
                  style: TextStyle(
                      color:Color(0xFF2E7D32),
                      fontFamily: 'Lato-Regular',
                      fontWeight: FontWeight.bold),
                )),
            Container(
              height: 22,
              width: 60,
              child: RaisedButton(
                onPressed: () {},
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
        ),
      ),);
  }
}
