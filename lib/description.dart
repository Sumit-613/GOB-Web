import 'package:flutter/material.dart';

import 'package:gob_app/listing.dart';

import 'Model/Card_model.dart';
import 'constants.dart';
import 'login.dart';
import 'listing.dart';


class DescriptionPage extends StatefulWidget {
  @override
  _DescriptionPageState createState() => _DescriptionPageState();
}

final List<Card_model> steps = [
  Card_model(
      imgurl: 'assets/image-24.png',
      title: 'Step 1',
      description:
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat uyam eratLorem ipsum dolor sit amet.',
      isfav: true),
  Card_model(
    imgurl: 'assets/image-24.png',
    title: 'Step 2',
    description:
    'Lorem ipsum dolor sit amet, consetetur sadipscingelitr, sed diam nonumy eirmod tempor invidunt utlabore et dolore magna aliquyam eratLoremipsum dolor sit amet, .',
  ),

];



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



class _DescriptionPageState extends State<DescriptionPage> {
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
                context, MaterialPageRoute(builder: (context) => listingpage()));
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
      body: Container(
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3,right: MediaQuery.of(context).size.width * 0.3),
        child:  SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height:  MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Image 24@2x.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height:  MediaQuery.of(context).size.height * 0.03,
                    ),
                    Image.asset("assets/Group 287@2x.png"),
                    SizedBox(
                      height:  MediaQuery.of(context).size.height * 0.05,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Jumping Jacks',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,fontFamily: 'OpenSans',
                                fontSize: 14),),
                            Text('07:35 min',style: TextStyle(
                                color: Colors.white,
                                fontSize: 14),),
                          ],
                        ),

                        SizedBox(width: MediaQuery.of(context).size.width * 0.45,),
                        IconButton(icon: Icon(Icons.favorite,color: Colors.white,),
                            onPressed: (){}),
                      ],
                    )
                  ],
                ),/* add child content here */
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15,right: 15),
                      child: Text('INSTRUCTION',
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontWeight: FontWeight.bold,fontFamily: 'OpenSans',
                              fontSize: 15))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(left: 15,right: 15),
                      child: Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. \n \nStet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et .',
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontWeight: FontWeight.w100,fontFamily: 'Poppins',
                              fontSize: 12))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                      child: Text('TARGETED MUSCELS',
                          style: TextStyle(
                              color: Color(0XFF303030),fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 15))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(left: 15,right: 15),
                      child: Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmodtempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. Atvero eos et accusam et justo duo dolores et ea rebum.',
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontWeight: FontWeight.w100,fontFamily: 'Poppins',
                              fontSize: 12))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                    color: Color(0x8AFFFFFF),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.35,
//                  margin: EdgeInsets.only(left: 10),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) =>
                          Steps(context, index),
                      itemCount: steps.length,
                    ),
                  ),
//                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                      child: Text('COMING UP NEXT',
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontWeight: FontWeight.bold,fontFamily: 'OpenSans',
                              fontSize: 15))
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(7),
                              width: 120,
                              height: 120,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/image-24.png',
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Jumping Jacks',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,fontFamily: 'OpenSans',),
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                                    Text(
                                      '06 min',
                                      style:
                                      TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Container(
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    width: 150,
                                    child: Text(
                                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor.Lorem ips dolor sit amet.',
                                      style: TextStyle(fontSize: 6.5, height: 1.8),
                                    )),
                                Container(width: 400,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.play_arrow,
                                        color: Colors.red,
                                      ),
                                      Text('Play the video',style: TextStyle(fontSize: 8,fontFamily: 'OpenSans',),),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                                      Container(
                                        child: FlatButton(
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {},
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      margin: EdgeInsets.only(top: 10, bottom: 5, left: 15),
                      child: Text('ADD YOUR COMMENTS HERE',
                          style: TextStyle(
                              color: Color(0XFF303030),
                              fontWeight: FontWeight.bold,fontFamily: 'OpenSans',
                              fontSize: 15))
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                    margin: EdgeInsets.only(left: 15,right: 15),
                    child:  TextField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.start,
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.black),
                      onChanged: (value) {
//                          email = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.send,
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
                              fontWeight: FontWeight.bold,fontFamily: 'OpenSans',
                              fontSize: 15))
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                    color: Color(0x8AFFFFFF),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.35,
//                  margin: EdgeInsets.only(left: 10),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) =>
                          Comment(context, index),
                      itemCount: Comments.length,
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
                        showModalBottomSheet(
                            context: context,
                            builder: (builder){
                              return new Container(
                                height: MediaQuery.of(context).size.height * 2,
                                color: Color(0x8A000000), //could change this to Color(0xFF737373),
                                //so you don't have to change MaterialApp canvasColor
                                child: new Container(
                                  decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: new BorderRadius.only(
                                          topLeft: const Radius.circular(20.0),
                                          topRight: const Radius.circular(20.0))),
                                  child:Container(
                                    color: Color(0x8AFFFFFF),
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height * 0.5,
//                  margin: EdgeInsets.only(left: 10),
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (BuildContext context, int index) =>
                                          Comment(context, index),
                                      itemCount: Comments.length,
                                    ),
                                  ),
                                ),
                              );
                            }
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0),
                        child: Text(
                          "See more Comments",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                ],
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget Comment(BuildContext context, int index){
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(Comments[index].imgurl,),
                ),
                radius: 42,
                backgroundColor: Colors.white,
              ),
              SizedBox(width: MediaQuery.of(context).size.height * 0.005,),
              Container(

                width: MediaQuery.of(context).size.height * 0.28,
                child:  Text(Comments[index].title,
                    style: TextStyle(
                        color: Color(0XFF303030),
                        fontWeight: FontWeight.bold,fontFamily: 'Poppins',
                        fontSize: 15)),
              ),

//              SizedBox(width: MediaQuery.of(context).size.height * 0.05,),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert,
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
                child:  FlatButton(
                  onPressed: () {
                  },
                  padding: EdgeInsets.only(left: 10,top: 7),
                  child: Text('Reply',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,fontFamily: 'Poppins',
                        decoration:
                        TextDecoration.underline,
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
        ],
      ),
    );

  }


  Widget Steps(BuildContext context, int index) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(7),
              width: MediaQuery.of(context).size.height * 0.18,
              height: 120,
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(steps[index].imgurl,),
                    fit: BoxFit.cover,
                  ),),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        onPressed: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => listingpage()));},
                        child: Image.asset("assets/group-287.png"),),]
                ),
              ),
            ),
            SizedBox(width:  MediaQuery.of(context).size.width * 0.02,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  steps[index].title,
                  style: TextStyle(
                    color: Color(0XFF303030),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,fontFamily: 'Poppins',),
                ),
                SizedBox(height:  MediaQuery.of(context).size.height * 0.004,),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    width: MediaQuery.of(context).size.height * 0.21,
                    child: Text(
                      favworkout[index].description,
                      style: TextStyle(fontSize: 8, height: 1.8,fontFamily: 'Poppins',),
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
