import 'package:flutter/material.dart';
import 'Category.dart';
import 'description.dart';
import 'package:gob_app/Model/Card_model.dart';

//import 'home_videos.dart';


class listingpage extends StatefulWidget {
  @override
  _listingpageState createState() => _listingpageState();
}

final List<Card_model> favworkout = [
  Card_model(
      imgurl: 'assets/image-24.png',
      title: 'JUMPING JACKS',
      duration: '06 min',
      description:
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor.Lorem ips dolor sit amet.',
      isfav: true),
  Card_model(
      imgurl: 'assets/image-24.png',
      title: 'JUMPING JACKS',
      duration: '06 min',
      description:
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor.Lorem ips dolor sit amet.',
      isfav: true),
  Card_model(
      imgurl: 'assets/image-24.png',
      title: 'JUMPING JACKS',
      duration: '06 min',
      description:
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor.Lorem ips dolor sit amet.',
      isfav: true),
  Card_model(
      imgurl: 'assets/image-24.png',
      title: 'JUMPING JACKS',
      duration: '06 min',
      description:
      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor.Lorem ips dolor sit amet.',
      isfav: true),

];



class _listingpageState extends State<listingpage> {
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
                context, MaterialPageRoute(builder: (context) => Categorypage()));
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
      body:Container(
        width: MediaQuery.of(context).size.height * 0.9,
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.25,right: MediaQuery.of(context).size.width * 0.1),
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
                  height:  MediaQuery.of(context).size.height * 0.04,
                ),
                FlatButton(onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => DescriptionPage()));
                }, child:Image.asset("assets/Group 287@2x.png"),),
                SizedBox(
                  height:  MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.only(left: 12 ,right:10,top: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
//                          SizedBox(
//                            width: 20,
//                          ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jumping Jacks',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 14),
                          ),
                          Text(
                            '07:35 min',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
//                          SizedBox(
//                            width: MediaQuery.of(context).size.width * 0.45,
//                          ),
                      IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                          onPressed: () {}),
                    ],
                  ),
                ),

              ],
            ),/* add child content here */
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Color(0XFFf0f0f0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 20, bottom: 5, left: 30),
                          child: Text('WORKOUT PLAYLIST',
                              style: TextStyle(
                                  color: Color(0XFF0d042b),
                                  fontWeight: FontWeight.bold,fontFamily: 'OpenSans Bold',
                                  fontSize: 15))),
                    ],
                  ),
                ),
                Container(
                  color: Color(0XFFf0f0f0),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.52,
                  margin: EdgeInsets.only(left: 10),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) =>
                        favoriteWorkoutCard(context, index),
                    itemCount: favworkout.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),),


    );
  }

  Widget favoriteWorkoutCard(BuildContext context, int index) {
    return Container(
      width: MediaQuery.of(context).size.height * 0.9,
//      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.2,right: MediaQuery.of(context).size.width * 0.18),
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
                      favworkout[index].imgurl,
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
                    children: [
                      Text(
                        favworkout[index].title,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,fontFamily: 'OpenSans SemiBold',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                      Text(
                        favworkout[index].duration,
                        style:
                        TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      width: 150,
                      child: Text(
                        favworkout[index].description,
                        style: TextStyle(fontSize: 8,fontFamily: 'Poppins',),
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.26,
                    child: Row(
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.red,
                        ),
                        Text('Play the video',style: TextStyle(fontSize: 8),),

                        Container(
                          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.14),
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
    );
  }
}
