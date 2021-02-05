import 'dart:ui';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gob_app/Model/Card_model.dart';
import 'package:gob_app/redux/actions.dart';
import 'package:video_player/video_player.dart';
import 'home1.dart';
import 'BookSummery.dart';
import 'checkOut.dart';

class Course extends StatefulWidget {
  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> {
  VideoPlayerController _controller;
  ChewieController _chewieController;

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  bool isPlaying = false;

  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer advancedPlayer;

  bool isplaying = false;
  String play = '';
  bool isbookbought = true;

  void initPlayer() {
    advancedPlayer = new AudioPlayer();

  }

  String localFilePath;

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    advancedPlayer.seek(newDuration);
  }

  List<Card_model> chapter = [
    Card_model(
      title: 'Chapter 1',
      duration: '50:00 min',
    ),
    Card_model(
      title: 'Chapter 2',
      duration: '50:00 min',
    ),
    Card_model(
      title: 'Chapter 3',
      duration: '50:00 min',
    ),
    Card_model(
      title: 'Chapter 4',
      duration: '50:00 min',
    ),
    Card_model(
      title: 'Chapter 5',
      duration: '50:00 min',
    ),
    Card_model(
      title: 'Chapter 6',
      duration: '50:00 min',
    ),
    Card_model(
      title: 'Chapter 7',
      duration: '50:00 min',
    ),
    Card_model(
      title: 'Chapter 8',
      duration: '50:00 min',
    ),
    Card_model(
      title: 'Chapter 9',
      duration: '50:00 min',
    ),
    Card_model(
      title: 'Chapter 10',
      duration: '50:00 min',
    ),
    Card_model(
      title: 'Chapter 11',
      duration: '50:00 min',
    ),
    Card_model(
      title: 'Chapter 12',
      duration: '50:00 min',
    ),
  ];

  List<List<Card_model>> chapterVideo = [
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
  ];

  List<List<Card_model>> chapterTextBook = [
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
  ];

  List<List<Card_model>> parts = [
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
    [Card_model(title: 'Loading', description: 'Loading', duration: 'Loading')],
  ];

  List<Card_model> highlights = [
    // Card_model(title: 'TEXT BOOK'),
    Card_model(title: 'AUDIO COURSE'),
    Card_model(title: 'VIDEO COURSE')
  ];

  // List<Card_model> highlightsText = [
  //   Card_model(
  //       title: 'Chapter 3',
  //       duration: 'Page No. 36',
  //       description:
  //           'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore '),
  //   Card_model(
  //       title: 'Chapter 3',
  //       duration: 'Page No. 36',
  //       description:
  //           'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore '),
  // ];

  List<Card_model> highlightAudio = [];

  List<Card_model> highlightVideo = [];








  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(

      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
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
            body: DefaultTabController(
              length: 4,
              child: Column(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(),
                    child: TabBar(
                        unselectedLabelColor: Colors.black,
                        isScrollable: false,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: Colors.deepOrange,
                        labelColor: Colors.deepOrange,
                        tabs: [
                          Tab(
                            child: Text(
                              'Text Book',
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.011),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Audio Course",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.011),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Video Course",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.011),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Highlights",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.011),
                            ),
                          ),
                        ]),
                  ),
                  Expanded(
                    child: Container(padding: EdgeInsets.symmetric(horizontal: 400),
                      child: TabBarView(children: [
                        Container(
                            color: Color(0XFFfafafa),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                        top: 10, bottom: 5, left: 20),
                                    child: Text(
                                      'CHARLES\'S COURSE',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',
                                          color: Color(0XFF0d042b),
                                          fontSize: 18),
                                    )),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: (isbookbought == false)
                                      ? SingleChildScrollView(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 450,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/Image 35.png')),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'COURSE BY CHARLES GLASS',
                                            style: TextStyle(
                                                color: Color(0XFF0d042b),
                                                fontWeight:
                                                FontWeight.bold,
                                                fontFamily: 'OpenSans',
                                                fontSize: 20),
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(
                                                top: 20,
                                              ),
                                              child: !isbookbought
                                                  ? Row(
                                                children: [
                                                  SizedBox(
                                                    width: 50,
                                                  ),
                                                  Container(
                                                    width: 100,
                                                    child:
                                                    RaisedButton(
                                                      onPressed:
                                                          () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => CheckOut(
                                                                  imgurl: 'assets/Image 35-1.png',
                                                                  title: 'Course By Charles Glass',
                                                                  quantity: 1,
                                                                )));
                                                      },
                                                      child: Text(
                                                        'Enroll',
                                                        style:
                                                        TextStyle(
                                                          color: Colors
                                                              .white,
                                                          fontFamily:
                                                          'OpenSans',
                                                        ),
                                                      ),
                                                      color: Colors
                                                          .red,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  RaisedButton(
                                                    color: Colors
                                                        .white,
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  booksummery()));
                                                    },
                                                    shape: RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            color: Colors
                                                                .red),
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                    child: Text(
                                                      'Learn More',
                                                      style:
                                                      TextStyle(
                                                        color: Colors
                                                            .red,
                                                        fontFamily:
                                                        'OpenSans',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                                  : RaisedButton(
                                                color: Colors.red,
                                                shape:
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      20),
                                                ),
                                                onPressed: () {},
                                                child: Container(
                                                  padding: EdgeInsets
                                                      .symmetric(
                                                      horizontal:
                                                      20,
                                                      vertical:
                                                      15),
                                                  child: Text(
                                                    'Continue Reading',
                                                    style:
                                                    TextStyle(
                                                      color: Colors
                                                          .white,
                                                      fontFamily:
                                                      'OpenSans',
                                                    ),
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  )
                                      : Container(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.755,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (BuildContext context,
                                          int index) =>
                                          ChapterTextCard(context, index),
                                      itemCount: chapterTextBook.length,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Container(
                          color: Color(0XFFfafafa),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      top: 20, bottom: 20, left: 20),
                                  child: Text(
                                    'CHARLES\'S COURSE',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans',
                                        color: Color(0XFF0d042b),
                                        fontSize: 18),
                                  )),
                              Container(
                                height:
                                MediaQuery.of(context).size.height * 0.65,
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                      ChapterCard(context, index),
                                  itemCount: chapter.length,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            color: Color(0XFFfafafa),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(
                                          top: 20, bottom: 20, left: 20),
                                      child: Text(
                                        'CHARLES\'S COURSE',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'OpenSans',
                                            color: Color(0XFF0d042b),
                                            fontSize: 18),
                                      )),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.65,
                                    margin:
                                    EdgeInsets.symmetric(horizontal: 20),
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemBuilder:
                                          (BuildContext context, int index) =>
                                          VideoChapterCard(context, index),
                                      itemCount: chapter.length,
                                    ),
                                  ),
                                ])),
                        Container(
                          color: Color(0XFFfafafa),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                        top: 20, bottom: 20, left: 20),
                                    child: Text(
                                      'MY HIGHLIGHTS',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',
                                          color: Color(0XFF0d042b),
                                          fontSize: 18),
                                    )),
                                Container(
                                  height:
                                  MediaQuery.of(context).size.height * 0.70,
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemBuilder:
                                        (BuildContext context, int index) =>
                                        HighlightCard(context, index),
                                    itemCount: highlights.length,
                                  ),
                                ),
                              ]),
                        )
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget ChapterCard(BuildContext context, int index) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  chapter[index].title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      color: Colors.red),
                ),
              ],
            ),
          ),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int subIndex) =>
                  partslist(context, index, subIndex, parts[index]),
              itemCount: parts[index].length,
            ),
          ),
        ],
      ),
    );
  }

  Widget partslist(BuildContext context, int chapterIndex, int index,
      List<Card_model> partContent) {
    return Column(
      children: [
        GestureDetector(
          child: ListTile(
            leading: Container(child: Image.asset('assets/group-287.png')),
            title: Container(
                margin: EdgeInsets.only(right: 0),
                child: Text(
                  partContent[index].title,
                  style: TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                  ),
                )),
            trailing: Container(
                child: Text(
                  partContent[index].duration,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                )),
          ),
          onTap: () async {
            var result =
            await advancedPlayer.setUrl(partContent[index].videoUrl);
            print(result);
            result = await advancedPlayer.pause();
            play = partContent[index].title;
            bool firstCall = true;
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return StatefulBuilder(builder:
                      (BuildContext context, StateSetter setSheetState) {
                    if (firstCall) {
                      advancedPlayer.onDurationChanged.listen((Duration d) {
                        setSheetState(() {
                          _duration = d;
                        });
                      });
                      advancedPlayer.onAudioPositionChanged
                          .listen((Duration d) {
                        setSheetState(() {
                          _position = d;
                        });
                      });
                      advancedPlayer.onPlayerCompletion.listen((event) {
                        advancedPlayer.pause();
                        setSheetState(() {
                          isplaying = false;
                        });
                      });
                    }

                    return new Container(
                      height: MediaQuery.of(context).size.height * 0.27,
                      color: Color(0x8A000000),
                      child: new Container(
                          decoration: new BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0XFF4B031F),
                                Color(0XFF952612)
                              ]),
                              borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(50.0),
                                  topRight: const Radius.circular(50.0))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      width:
                                      MediaQuery.of(context).size.height *
                                          0.3,
                                      margin: EdgeInsets.only(
                                          top: 30,
                                          bottom: 20,
                                          left: 40,
                                          right: 30),
                                      child: Text(
                                        play,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 10),
                                      )),
                                  IconButton(
                                      icon: Icon(
                                        partContent[index].isfav
                                            ? Icons.favorite
                                            : Icons.favorite_border_outlined,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {

                                      })
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.height * 0.6,
                                height:
                                MediaQuery.of(context).size.height * 0.03,
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    inactiveTrackColor: Color(0x8AFFFFFF),
                                    activeTrackColor: Color(0xB3FFFFFF),
                                    thumbColor: Colors.white,
                                    overlayColor: Color(0x29EB1555),
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 8.0),
                                    overlayShape: RoundSliderOverlayShape(
                                        overlayRadius: 28.0),
                                  ),
                                  child: Slider(
                                    value: _position.inSeconds.toDouble(),
                                    min: 0.0,
                                    max: _duration.inSeconds.toDouble(),
                                    onChanged: (double value) {
                                      print(value);
                                      setState(() {
                                        seekToSecond(value.toInt());
                                        value = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Text(_position.toString(),
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.1,
                                  ),
                                  Text(
                                    partContent[index].duration,
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              SizedBox(
                                height:
                                MediaQuery.of(context).size.height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      icon: Icon(
                                        Icons.skip_previous,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      onPressed: () {}),
                                  Container(
                                    width: 80,
                                    child: FlatButton(
                                      onPressed: () async {
                                        if (isplaying) {
                                          var result =
                                          await advancedPlayer.pause();
                                        } else {
                                          var result =
                                          await advancedPlayer.resume();
                                        }
                                        setSheetState(() {
                                          isplaying = !isplaying;
                                          print(isplaying);
                                        });
                                      },
                                      child: Image.asset(
                                        isplaying
                                            ? 'assets/Group 238@2x.png'
                                            : 'assets/Group 407@2x.png',
                                        filterQuality: FilterQuality.high,
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        Icons.skip_next,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      onPressed: () {}),
                                ],
                              )
                            ],
                          )),
                    );
                  });
                });
          },
        ),
        Container(
            margin: EdgeInsets.only(left: 30),
            child: Divider(
              color: Colors.grey[300],
              indent: 30,
              endIndent: 30,
            )),
      ],
    );
  }

  Widget ChapterTextCard(BuildContext context, int index) {
    return Card(
      child: ExpansionTile(
        title: Text(
          chapter[index].title,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          Icons.arrow_drop_down_sharp,
          color: Colors.red,
        ),
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int subIndex) =>
                ChapterContentCard(context, subIndex, chapterTextBook[index]),
            itemCount: 1,
          ),
        ],
      ),
    );
  }

  Widget ChapterContentCard(
      BuildContext context, int index, List<Card_model> chapterContent) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Container(
              child: Html(
                data: '<b>${chapterContent[index].title}</b>',
              )),
          Container(
              margin: EdgeInsets.only(top: 5),
              child: Html(
                data: chapterContent[index].description,
              )),
        ],
      ),
    );
  }

  Widget VideoChapterCard(BuildContext context, int index) {
    return Container(
      //height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  chapter[index].title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      color: Colors.red),
                ),
              ],
            ),
          ),
          Container(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int subIndex) =>
                    ChapterVideoContentCard(
                        context, subIndex, index, chapterVideo[index]),
                itemCount: chapterVideo[index].length,
              )),
        ],
      ),
    );
  }

  Widget ChapterVideoContentCard(BuildContext context, int index,
      int chapterIndex, List<Card_model> chapterVideos) {
    bool isLiked = false;
    return Column(children: [
      Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.15,
        child: Card(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Center(
                    child: Container(
                      child: FlatButton(
                        onPressed: () async {
                          final video = chapterVideos[index].videoUrl;
                          final old = _controller;
                          if (old != null) {
                            old.pause();
                            old.dispose();
                          }
                          _controller = VideoPlayerController.network(video);
                          showGeneralDialog(
                            barrierDismissible: true,
                            barrierLabel: '',
                            barrierColor: Colors.black38,
                            transitionDuration: Duration(milliseconds: 500),
                            pageBuilder: (ctx, anim1, anim2) {
                              return StatefulBuilder(
                                  builder: (context, setDialogState) {

                                    return Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20)),
                                      child: Container(
                                          child: AlertDialog(
                                              contentPadding: EdgeInsets.zero,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor: Colors.transparent,
                                              // child: _controller.value.initialized
                                              //     ? AspectRatio(
                                              //         aspectRatio: _controller
                                              //             .value.aspectRatio,
                                              //         child: VideoPlayer(
                                              //             _controller),
                                              //       )
                                              //     : Container(),
                                             )),
                                    );
                                  });
                            },
                            transitionBuilder: (ctx, anim1, anim2, child) =>
                                BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 4 * anim1.value,
                                      sigmaY: 4 * anim1.value),
                                  child: FadeTransition(
                                    child: child,
                                    opacity: anim1,
                                  ),
                                ),
                            context: context,
                          );
                        },
                        child: Image.asset('assets/Group 287@2x.png'),
                      ),
                      height: 60,
                      width: 60,
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(chapterVideos[index].imgurl ==
                              null ||
                              chapterVideos[index].imgurl == ""
                              ? "https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Black_colour.jpg/450px-Black_colour.jpg"
                              : chapterVideos[index].imgurl),
                          fit: BoxFit.cover)),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.015,
                        ),
                        Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.01),
                            width: MediaQuery.of(context).size.width * 0.18,
                            child: Text(
                              chapterVideos[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0XFF0d042b),
                                  fontSize: 10),
                            )),
                      ],
                    ),

                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.08),
                          width: MediaQuery.of(context).size.width * 0.03,
                          child: Column(
                            children: [
                              Text(
                                chapterVideos[index].duration,
                                style: TextStyle(
                                    fontSize: 8, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0010,
                        ),
                        Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.077),
                            width: MediaQuery.of(context).size.width * 0.05,
                            child: IconButton(
                                icon: Icon(((chapterVideos[index].isfav == null
                                    ? false
                                    : chapterVideos[index].isfav)
                                    ? Icons.favorite
                                    : Icons.favorite_border)),
                                onPressed: () {

                                }))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  // popup button
  static const menuItems = <String>[
    'Delete Highlights',
  ];
  final List<PopupMenuItem<String>> _popUpMenuItems = menuItems
      .map(
        (String value) => PopupMenuItem<String>(
      value: value,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0XFF5C161B), Color(0XFFC5351A)])),
          child: Center(
            child: Text(
              value,
              style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ),
  )
      .toList();
  String _btn3SelectedVal;
  // popup button

  Widget HighlightCard(BuildContext context, int index) {
    int i = index;
    return Container(
      //height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  highlights[index].title,
                  style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
                FlatButton(
                  onPressed: () {
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: FadeTransition(
                        opacity: null,
                        child: PopupMenuButton<String>(
                          color: Color(0xB3FFFFFF),
                          elevation: 0,
                          onSelected: (String newValue) {
                            _btn3SelectedVal = newValue;
                          },
                          itemBuilder: (BuildContext context) =>
                          _popUpMenuItems,
                        ),
                      ),
                    );
                  },
                  child: PopupMenuButton<String>(
                    color: Color(0xB3FFFFFF),
                    elevation: 0,
                    onSelected: (String newValue) {
                      _btn3SelectedVal = newValue;
                    },
                    itemBuilder: (BuildContext context) => _popUpMenuItems,
                  ),
                ),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 1,
                minHeight: 0),
            child: Container(
              // height: MediaQuery.of(context).size.height * 0.4,
              child:
              // (i == 0)
              //     ? ListView.builder(
              //         shrinkWrap: true,
              //         scrollDirection: Axis.vertical,
              //         physics: NeverScrollableScrollPhysics(),
              //         itemBuilder: (BuildContext context, int index) =>
              //             HighlightTextContentCard(context, index),
              //         itemCount: highlightsText.length,
              //       )
              //     :
              (i == 0)
                  ? ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) =>
                    HighlightAudioContentCard(context, index),
                itemCount: highlightAudio.length,
              )
                  : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) =>
                    HighlightVideoContentCard(context, index),
                itemCount: highlightVideo.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget HighlightTextContentCard(BuildContext context, int index) {
  //   return Card(
  //     child: Container(
  //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
  //       margin: EdgeInsets.all(10),
  //       child: Column(
  //         children: [
  //           Container(
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text(highlightsText[index].title),
  //                 Text(highlightsText[index].duration)
  //               ],
  //             ),
  //           ),
  //           Container(
  //             width: double.infinity,
  //             margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
  //             child: Text(
  //               highlightsText[index].description,
  //               style: TextStyle(fontSize: 10),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget HighlightAudioContentCard(BuildContext context, int index) {
    return GestureDetector(
        child: ListTile(
          leading: Image.asset('assets/Group 287.png'),
          title: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                highlightAudio[index].title,
                style: TextStyle(fontSize: 10),
              )),
          trailing: Text(
            highlightAudio[index].duration,
            style: TextStyle(color: Colors.red),
          ),
        ),
        onTap: () async {
          var result =
          await advancedPlayer.setUrl(highlightAudio[index].videoUrl);
          print(result);
          result = await advancedPlayer.pause();
          play = highlightAudio[index].title;
          bool firstCall = true;
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setSheetState) {
                      if (firstCall) {
                        advancedPlayer.onDurationChanged.listen((Duration d) {
                          setSheetState(() {
                            _duration = d;
                          });
                        });
                        advancedPlayer.onAudioPositionChanged.listen((Duration d) {
                          setSheetState(() {
                            _position = d;
                          });
                        });
                        advancedPlayer.onPlayerCompletion.listen((event) {
                          advancedPlayer.pause();
                          setSheetState(() {
                            isplaying = false;
                          });
                        });
                      }

                      return new Container(
                        height: MediaQuery.of(context).size.height * 0.27,
                        color: Color(0x8A000000),
                        child: new Container(
                            decoration: new BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Color(0XFF4B031F), Color(0XFF952612)]),
                                borderRadius: new BorderRadius.only(
                                    topLeft: const Radius.circular(50.0),
                                    topRight: const Radius.circular(50.0))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        width: MediaQuery.of(context).size.height *
                                            0.3,
                                        margin: EdgeInsets.only(
                                            top: 30,
                                            bottom: 20,
                                            left: 40,
                                            right: 30),
                                        child: Text(
                                          play,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 10),
                                        )),
                                    IconButton(
                                        icon: Icon(
                                          Icons.favorite,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {

                                        })
                                  ],
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.height * 0.6,
                                  height: MediaQuery.of(context).size.height * 0.03,
                                  child: SliderTheme(
                                    data: SliderTheme.of(context).copyWith(
                                      inactiveTrackColor: Color(0x8AFFFFFF),
                                      activeTrackColor: Color(0xB3FFFFFF),
                                      thumbColor: Colors.white,
                                      overlayColor: Color(0x29EB1555),
                                      thumbShape: RoundSliderThumbShape(
                                          enabledThumbRadius: 8.0),
                                      overlayShape: RoundSliderOverlayShape(
                                          overlayRadius: 28.0),
                                    ),
                                    child: Slider(
                                      value: _position.inSeconds.toDouble(),
                                      min: 0.0,
                                      max: _duration.inSeconds.toDouble(),
                                      onChanged: (double value) {
                                        print(value);
                                        setState(() {
                                          seekToSecond(value.toInt());
                                          value = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(_position.toString(),
                                        style: TextStyle(color: Colors.white)),
                                    SizedBox(
                                      width:
                                      MediaQuery.of(context).size.height * 0.1,
                                    ),
                                    Text(
                                      highlightAudio[index].duration,
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        icon: Icon(
                                          Icons.skip_previous,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        onPressed: () {}),
                                    Container(
                                      width: 80,
                                      child: FlatButton(
                                        onPressed: () async {
                                          if (isplaying) {
                                            var result =
                                            await advancedPlayer.pause();
                                          } else {
                                            var result =
                                            await advancedPlayer.resume();
                                          }
                                          setSheetState(() {
                                            isplaying = !isplaying;
                                            print(isplaying);
                                          });
                                        },
                                        child: Image.asset(
                                          isplaying
                                              ? 'assets/Group 238@2x.png'
                                              : 'assets/Group 407@2x.png',
                                          filterQuality: FilterQuality.high,
                                          width: 50,
                                          height: 50,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon(
                                          Icons.skip_next,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        onPressed: () {}),
                                  ],
                                )
                              ],
                            )),
                      );
                    });
              });
        });
  }

  Widget HighlightVideoContentCard(BuildContext context, int index) {
    return Column(children: [
      Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width * 0.25,
        child: Card(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset('assets/Group 287@2x.png'),
                        height: 30,
                        width: 30,
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(highlightVideo[index].imgurl),
                            fit: BoxFit.cover)),
                  ),
                  onTap: () async {
                    final video = highlightVideo[index].videoUrl;
                    final old = _controller;
                    if (old != null) {
                      old.pause();
                      old.dispose();
                    }
                    _controller = VideoPlayerController.network(video);
                    showGeneralDialog(
                      barrierDismissible: true,
                      barrierLabel: '',
                      barrierColor: Colors.black38,
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (ctx, anim1, anim2) {
                        return StatefulBuilder(
                            builder: (context, setDialogState) {

                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                    child: AlertDialog(
                                        contentPadding: EdgeInsets.zero,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        // child: _controller.value.initialized
                                        //     ? AspectRatio(
                                        //         aspectRatio: _controller
                                        //             .value.aspectRatio,
                                        //         child: VideoPlayer(
                                        //             _controller),
                                        //       )
                                        //     : Container(),
                                       )),
                              );
                            });
                      },
                      transitionBuilder: (ctx, anim1, anim2, child) =>
                          BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
                            child: FadeTransition(
                              child: child,
                              opacity: anim1,
                            ),
                          ),
                      context: context,
                    );
                  },
                ),
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Text(
                          highlightVideo[index].title,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0XFF0d042b),
                              fontSize: 10),
                        )),
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.016,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.12,
                      child: Column(
                        children: [
                          Text(
                            highlightVideo[index].duration,
                            style: TextStyle(
                                fontSize: 8, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0009,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onPressed: () {

                            }))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}