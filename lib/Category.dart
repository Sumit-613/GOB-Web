import 'package:flutter/material.dart';
import 'home1.dart';
import 'listing.dart';
import 'package:gob_app/Model/Card_model.dart';
//import '../views/home_videos.dart';

class Categorypage extends StatefulWidget {
  @override
  _CategorypageState createState() => _CategorypageState();
}


final List<Card_model> Workoutlist = [
  Card_model(
      imgurl: 'assets/Image 24@2x.png',
      title: 'Roman Chair Leg Lifts',
      duration: '07:35 min',
      isfav: true),
  Card_model(
      imgurl: 'assets/Image 24@2x.png',
      title: 'Roman Chair Leg Lifts',
      duration: '07:35 min',
      isfav: true),
  Card_model(
      imgurl: 'assets/Image 24@2x.png',
      title: 'Roman Chair Leg Lifts',
      duration: '07:35 min',
      isfav: true),
  Card_model(
      imgurl: 'assets/Image 24@2x.png',
      title: 'Roman Chair Leg Lifts',
      duration: '07:35 min',
      isfav: true),
  Card_model(
      imgurl: 'assets/Image 24@2x.png',
      title: 'Roman Chair Leg Lifts',
      duration: '07:35 min',
      isfav: true),
  Card_model(
      imgurl: 'assets/Image 24@2x.png',
      title: 'Roman Chair Leg Lifts',
      duration: '07:35 min',
      isfav: true),
];


class _CategorypageState extends State<Categorypage> {
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
      body: Column(
        children: [
          Container(
            color: Colors.white,
//            width: MediaQuery.of(context).size.height * 0.9,
//            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.2,right: MediaQuery.of(context).size.width * 0.18),
            child: Container(margin: EdgeInsets.symmetric(vertical: 0.7,horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 8, bottom: 5, left: 10),
                      child: Text('WORKOUT PROGRAMS',
                          style: TextStyle(
                              color: Color(0XFF0d042b),
                              fontWeight: FontWeight.bold,fontFamily: 'OpenSans Bold',
                              fontSize: 15))),

                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    onPressed: () {},
                    color: Color(0xFFD6D6D6),
                    child: Row(
                      children: [
                        Image.asset( 'assets/Path 31.png',color: Colors.black,),

                        SizedBox(width: MediaQuery.of(context).size.width * 0.025,),
                        Text('Filter',style: TextStyle(color: Color(0XFF0d042b),fontWeight: FontWeight.bold,fontFamily: 'Poppins',))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          SingleChildScrollView(
            child: Container(
              color: Color(0XFFf0f0f0),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              margin: EdgeInsets.only(left: 10),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) =>
                    WorkoutPlaylist(context, index),
                itemCount: Workoutlist.length,
              ),
            ),
          )

        ],
      ),
    );
  }


  Widget WorkoutPlaylist(BuildContext context, int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height:  MediaQuery.of(context).size.height * 0.4,
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.2,right: MediaQuery.of(context).size.width * 0.18),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Workoutlist[index].imgurl,
              ),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              FlatButton(
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => listingpage()));},
                child: Container(
                  child: CircleAvatar(
                    backgroundColor: Color(0x1AFFFFFF),
                    backgroundImage: AssetImage(
                        'assets/Group 287@2x.png'),
                    radius: 25,
                  ),), ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Container(
                padding: EdgeInsets.only(left: 12 ,right:5,),
                decoration: BoxDecoration(color: Color(0x61000000)),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
//                      SizedBox(width: MediaQuery.of(context).size.height * 0.02,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Workoutlist[index].title,style: TextStyle(
                            fontWeight: FontWeight.bold,fontFamily: 'OpenSans Bold',
                            color: Colors.white,
                            fontSize: 14),),
                        Text(Workoutlist[index].duration,style: TextStyle(
                            color: Colors.white,
                            fontSize: 14),),
                      ],
                    ),

//                      SizedBox(width:  MediaQuery.of(context).size.height * 0.1,),
                    IconButton(icon: Icon(Icons.favorite_border,color: Colors.white,),
                        onPressed: (){}),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }


}
