import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gob_app/change_password2.dart';
import 'package:gob_app/redux/actions.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'EmptyState.dart';
import 'checkOut.dart';
import 'payment m 2.dart';
import 'productGrid.dart';
import 'product_description.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import './Model/app_state.dart';
import './Model/user_model.dart';
import 'BookCover.dart';
import 'Category.dart';
import 'Model/app_state.dart';
import 'Model/user_model.dart';
import 'login.dart';
import 'Course.dart';
import 'constants.dart';
import 'Model/Card_model.dart';
import 'change_password.dart';
import 'terms&conditions.dart';
import 'policies.dart';
import 'MyOrders.dart';

class Home1 extends StatefulWidget {
  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  final List<Card_model> level = [
    Card_model(
        imgurl: 'assets/1611503216018.JPEG',
        title: 'Beginner',
        duration: '26 Videos | 60 min'),
    Card_model(
        imgurl: 'assets/1611503265900.JPEG',
        title: 'Intermediate',
        duration: '26 Videos | 60 min'),
    Card_model(
        imgurl: 'assets/1611503292952.JPEG',
        title: 'Advance',
        duration: '26 Videos | 60 min'),
  ];
  final List<Card_model> exercise = [
    Card_model(
        imgurl: 'assets/image-24.png',
        title: 'Roman Chair Leg Lifts',
        duration: '07:35 min'),
    Card_model(
        imgurl: 'assets/image-24.png',
        title: 'Roman Chair Leg Lifts',
        duration: '07:35 min'),
  ];
  final List<Card_model> bodypart = [
    Card_model(imgurl: 'assets/chest-category.jpg', title: 'Chest'),
    Card_model(imgurl: 'assets/shoulders-category.jpg', title: 'Shoulder'),
    Card_model(imgurl: 'assets/bicept-category.jpg', title: 'Biceps'),
    Card_model(imgurl: 'assets/triceps-category.jpg', title: 'Triceps'),
    Card_model(imgurl: 'assets/back-category.jpg', title: 'Lats'),
    Card_model(imgurl: 'assets/abs-category.jpg', title: 'Abs'),
    Card_model(imgurl: 'assets/quad-category.jpg', title: 'Quads'),
    Card_model(imgurl: 'assets/IMG_4864.jpg', title: 'Calves'),





  ];
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
  ];
  static const menuItems = <String>[
    'Male',
    'Female',
    'Others',
  ];

  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
      )
      .toList();

  int selectedIndex = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _formkey = GlobalKey<FormState>();
  bool _showSpinner = false;
  String _btn2SelectedVal;
  String name;
  String phNo;
  String email;
  String age;
  File _image;

  Future<UserModel> dispatchUser(String email) async {
    UserModel user = new UserModel();
    await _firestore
        .collection('custData')
        .doc(email)
        .get()
        .then((DocumentSnapshot snapshot) async {
      dynamic data = snapshot.data();
      user.fullName = data['name'];
      user.email = email;
      user.phNo = data['phoneNo'];
      user.gender = data['gender'];
      user.age = data['age'];
      user.photoURL = data['photoURL'];
    });
    return user;
  }

  Future chooseImage() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickedImage.path);
    });
  }

  Future uploadImage() async {
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('profiles/${Path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(File(_image.path));
    await uploadTask.onComplete;
    print('Image Uploaded');
    return await storageReference.getDownloadURL();
  }

  void _showDialog(BuildContext context, Error error) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Something Went Wrong!"),
          content: new Text(error.toString()),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _logout() async {
    try {
      await _auth.signOut().then((_) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      });
    } catch (e) {
      _showDialog(context, e);
    }
  }

  void updateInfo(String name, String phNo, String email,
      String _btn2SelectedVal, String age, String fileURL) async {
    print(email);
    _firestore.collection('custData').doc(email).set({
      'name': name,
      'phoneNo': phNo,
      'email': email,
      'gender': _btn2SelectedVal,
      'age': age,
      'photoURL': fileURL,
    });
  }

  @override
  Widget build(BuildContext context) {
    final widgetOptions = [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3, top: 10,bottom:5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'PROGRAMS',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: 'OpenSans'),
                ),
                // SizedBox(width:MediaQuery.of(context).size.width*0.28 ,),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
                  buildLevelCard(context, index),
              itemCount: level.length,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3, right: 5,top: 20,bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'PREVIOUS VIDEOS',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: 'OpenSans'),
                ),
                //SizedBox(width:110 ,),
              ],
            ),
          ),
          Container(
             width: double.infinity,
            height: 130,
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
                  buildexercise(context, index),
              itemCount: exercise.length,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3, right: 5,top: 20,bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'BODY PARTS WORKOUT',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: 'OpenSans'),
                ),
                //SizedBox(width:75,),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 165,
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
                  bodyexercise(context, index),
              itemCount: bodypart.length,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookCover(),
                  ));
            },
            child: Container(
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3),
              width: 530,
              height: 290,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/Group 282.png'),
                  fit: BoxFit.fill,
                ),
              ),
//              decoration: BoxDecoration(
//                  image: DecorationImage(
//                      image: AssetImage('assets/Group 282.png'),
//                      fit: BoxFit.cover)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3, right: 5,top: 20,bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'GOB PRODUCTS',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: 'OpenSans'),
                ),
                //SizedBox(width:120 ,),
                FlatButton(
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 9,
                      color: Colors.red,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductGrid()));
                  },
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
                  productsCard(context, index),
              itemCount: products.length,
            ),
          ),
          GestureDetector(
              onTap: () {
//                Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                        builder: (context) => CheckOut(
//                          imgurl:
//                          'assets/gob-pre-workout-b-1000-px-removebg-preview.png',title: 'GOB PRE-WORkout',price: '\$ 87.7',quantity: 1,
//                        )));
              },

              child: Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3,right: 5,top: 20,bottom: 20),
                width: 530,
                height: 290,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('assets/Group 283.png'),
                    fit: BoxFit.fill,
                  ),
                ),
//                decoration: BoxDecoration(
//                    image: DecorationImage(
//                        image: AssetImage('assets/Group 283.png'))),
              )),
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.5, right: 5,top: 20,bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'WORKOUT LIBRARY',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: 'OpenSans'),
                ),
                //SizedBox(width:100 ,),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 130,
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3,),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
                  buildexercise(context, index),
              itemCount: exercise.length,
            ),
          ),
        ],
      ),
      Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20,left: MediaQuery.of(context).size.width * 0.3),
                      child: Text('MY FAVORITE WORKOUTS',
                          style: TextStyle(
                              color: Color(0XFF0d042b),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans-Bold',
                              fontSize: 15))),
                ],
              ),
            ),
            Container(

              width: MediaQuery.of(context).size.width*0.4,
              height: MediaQuery.of(context).size.height * 0.75,
           margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.22),
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
      ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Form(
      child: Container(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.10),
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.22),
        color: Color(0XFFf0f0f0),
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    child: CircleAvatar(
                        radius: 40,
                        backgroundImage:  NetworkImage(
                            'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png')
                            ),
                    radius: 42,
                    backgroundColor: Colors.black,
                  ),
                  Positioned(
                    child: ClipOval(
                      child: Container(
                          color: Colors.white,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 13,
                          )),
                    ),
                    left: 57,
                    top: 55,
                  ),
                  Positioned(
                    child: FlatButton(
                      child: Icon(
                        Icons.camera_alt,
                        size: 20,
                      ),
                      onPressed: () async {
                        await chooseImage();
                      },
                    ),
                    left:MediaQuery.of(context).size.width*0.073,
                    top: MediaQuery.of(context).size.height*0.056,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Edit Profile',
                style: TextStyle(
                    fontSize: 18,fontFamily: 'Poppins'
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black,fontSize: 18,fontFamily: 'Poppins'),
                validator: (value) => value.isEmpty
                    ? 'Please Enter Your Full Name'
                    : null,
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Your Full Name*',
                  hintStyle: TextStyle(fontSize: 18,fontFamily: 'Poppins'),
                  fillColor: Colors.white,
                ),

              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black,fontSize: 18,fontFamily: 'Poppins'),
                validator: (value) => value.length < 10
                    ? 'Please Enter A 10 Digit Valid Mobile Number'
                    : null,
                onChanged: (value) {
                  setState(() {
                    phNo = value;
                  });
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Your Mobile Number*',
                    hintStyle: TextStyle(fontSize: 18,fontFamily: 'Poppins'),
                    fillColor: Colors.white),

              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black,fontSize: 18,fontFamily: 'Poppins'),
                validator: (value) {
                  RegExp emailRegEx =
                  new RegExp(r'^\S+@\S+[\.][0-9a-z]+$');
                  if (value.isEmpty) {
                    return 'Enter An Email';
                  } else if (!emailRegEx.hasMatch(value)) {
                    return 'Enter A Valid Email';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Your Email*',
                    hintStyle: TextStyle(fontSize: 18,fontFamily: 'Poppins'),
                    fillColor: Colors.white),

              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.white,
                    )),
                child: DropdownButtonFormField(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                  ),
                  iconSize: 20,
                  iconEnabledColor: Colors.black,
                  isExpanded: true,
                  dropdownColor: Colors.grey,
                  style: TextStyle(color: Colors.black,fontSize: 18,fontFamily: 'Poppins'),
                  value: _btn2SelectedVal,
                  validator: (value) => value == null
                      ? 'Please Fill In Your Gender'
                      : null,
                  hint: Text(
                    'Select Your Gender*',
                    style: TextStyle(),
                  ),
                  onChanged: ((String newValue) {
                    setState(() {
                      _btn2SelectedVal = newValue;
                    });
                  }),
                  items: _dropDownMenuItems,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black,fontSize: 18,fontFamily: 'Poppins'),
                validator: (value) =>
                value.isEmpty ? 'Please Enter Your Age' : null,
                onChanged: (value) {
                  setState(() {
                    age = value;
                  });
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Your Age*',
                    hintStyle: TextStyle(fontSize: 18,fontFamily: 'Poppins'),
                    fillColor: Colors.white),

              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0XFF5C161B),
                        Color(0XFFC5351A)
                      ]),
                      borderRadius: BorderRadius.circular(40.0)),
                  child: MaterialButton(
                    onPressed: () async {
                      String fileURL;
                      if (_formkey.currentState.validate()) {
                        setState(() {
                          _showSpinner = true;
                        });

                        try {
                          UserModel user = await dispatchUser(
                              _auth.currentUser.email);
                          if (_image == null) {
                            updateInfo(
                                name,
                                phNo,
                                email,
                                _btn2SelectedVal,
                                age,
                                user.photoURL);
                            StoreProvider.of<AppState>(context)
                                .dispatch(UserLoginAction(
                                new UserModel.init(
                                    name,
                                    phNo,
                                    email,
                                    _btn2SelectedVal,
                                    age,
                                    user.photoURL)));
                          } else {
                            fileURL = await uploadImage();
                            StoreProvider.of<AppState>(context)
                                .dispatch(UserLoginAction(
                                new UserModel.init(
                                    name,
                                    phNo,
                                    email,
                                    _btn2SelectedVal,
                                    age,
                                    fileURL)));
                            updateInfo(name, phNo, email,
                                _btn2SelectedVal, age, fileURL);
                          }
                          setState(() {
                            _showSpinner = false;
                          });
                        } catch (e) {
                          _showDialog(context, e);
                        }
                      }
                    },
                    child: Container(
                      child: Text(
                        "SUBMIT",
                        style: TextStyle(color: Colors.white,
                            fontSize: 18,fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )),

    ];
    final drawerHeader = DrawerHeader(
        child: Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Positioned(
          child: FlatButton(
            padding: EdgeInsets.only(right: 50),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        //
        StoreConnector<AppState, String>(
            converter: (store) => store.state.getUser().fullName,
            builder: (BuildContext context, String name) {
              return Text(
                name,
                style: TextStyle(
                  fontFamily: 'Lato-Bold',
                  color: Colors.white,
                ),
              );
            }),
      ]),
    ));

    return Scaffold(
      drawer: Drawer(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0XFF952612), Color(0XFF4B031F), Color(0XFF0d042b)],
                )),
            child: ListView(
              children: [
                DrawerHeader(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: FlatButton(
                                padding: EdgeInsets.only(right: 50),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            //
                            StoreConnector<AppState, String>(
                                converter: (store) =>
                                store.state.getUser().fullName,
                                builder: (BuildContext context, String name) {
                                  return Text(
                                    name,
                                    style: TextStyle(
                                      fontFamily: 'Lato-Bold',
                                      color: Colors.white,
                                    ),
                                  );
                                }),
                          ]),
                    )),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Categorypage(),
                        ));
                  },
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 20),
                        child: Text(
                          'All Workout Video',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Poppins-Light'),
                        ),
                      )),
                  color: Colors.transparent,
                ),
                Divider(
                  color: Color(0XFF707070),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Course(),
                        ));
                  },
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Charles\'s course',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Poppins-Light'),
                        ),
                      )),
                  color: Colors.transparent,
                ),
                Divider(
                  color: Color(0XFF707070),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductGrid()));
                  },
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Charles\'s Workout Products',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Poppins-Light'),
                        ),
                      )),
                  color: Colors.transparent,
                ),
                Divider(
                  color: Color(0XFF707070),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyOrders()));
                  },
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'My Orders',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins-Light'),
                        ),
                      )),
                  color: Colors.transparent,
                ),
                Divider(
                  color: Color(0XFF707070),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Coupons()));
                  },
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'My Subscription',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Poppins-Light'),
                        ),
                      )),
                  color: Colors.transparent,
                ),
                Divider(
                  color: Color(0XFF707070),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePassword2()));
                  },
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Change Password',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Poppins-Light'),
                        ),
                      )),
                  color: Colors.transparent,
                ),
                Divider(
                  color: Color(0XFF707070),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => Terms()));

                },
                  child: ListTile(
                    contentPadding: EdgeInsets.only(
                      left: 25,
                    ),
                    title: Text(
                      'Terms & Conditions',
                      style: TextStyle(
                          fontFamily: 'Poppins-ExtraLight',
                          color: Colors.white,
                          fontWeight: FontWeight.w100),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => policies()));

                  },
                  contentPadding: EdgeInsets.only(
                    left: 25,
                  ),
                  title: Text(
                    'Privacy & Policy',
                    style: TextStyle(
                        fontFamily: 'Poppins-ExtraLight',
                        color: Colors.white,
                        fontWeight: FontWeight.w100),
                  ),
                ),
                GestureDetector(
                  child: ListTile(
                      contentPadding: EdgeInsets.only(
                        left: 25,
                      ),
                      title: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Text(
                            'Logout',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.05,
                            child: Image.asset('assets/path-39.png'),
                          )
                        ],
                      )),
                  onTap: () {
//                    _showSignOutDialog(context);
                  },
                ),
                SizedBox(height: 50)
              ],
            )),
      ),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0XFF5C161B), Color(0XFFC5351A)])),
        ),
        title: Text(
          'Charles Glass',
          style: TextStyle( fontFamily: 'Poppins-Light',
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        actions: [Container(width:MediaQuery.of(context).size.width*0.05,
            child: FlatButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EmptyState()));
            }, child: Icon(Icons.shopping_cart,color: Colors.white,))),
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
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.2,left: MediaQuery.of(context).size.width * 0.01),

        child:SingleChildScrollView(
        child: SafeArea(
          child: widgetOptions.elementAt(selectedIndex),
        ),
      ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.red,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: selectedIndex == 0
                ? Image.asset('assets/group-28.png')
                : Image.asset(
                    'assets/group-28.png',
                    color: Colors.black,
                  ),
            title: new Text(
              'Home',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: selectedIndex != 1
                ? Image.asset(
                    'assets/group-32.png',
                  )
                : Image.asset(
                    'assets/group-32.png',
                    color: Colors.red,
                  ),
            title: new Text(
              'My Workout',
              style: TextStyle(color: Colors.black),
            ),
          ),
          BottomNavigationBarItem(
            icon: selectedIndex != 2
                ? Image.asset('assets/group-284.png')
                : Image.asset(
                    'assets/group-284.png',
                    color: Colors.red,
                  ),
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLevelCard(BuildContext context, int index) {
    return GestureDetector(
      child: Container(margin: EdgeInsets.only(right: 7),
        width: MediaQuery.of(context).size.width * 0.16,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(level[index].imgurl),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 85,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      level[index].title,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      level[index].duration,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontFamily: 'Poppins-Light'),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005),
                    Container(
                      height: 22,
                      width: 65,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CheckOut(
                                    imgurl: level[index].imgurl,
                                    title: level[index].title,
                                    quantity: 1,
                                  )));
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
                )
              ],
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Categorypage()));
      },
    );
  }

  Widget buildexercise(BuildContext context, int index) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 7),
        width: MediaQuery.of(context).size.width * 0.23,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(exercise[index].imgurl),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.032,
            ),
            FlatButton(
              onPressed: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => previous_videos()));
              },
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/Group 287@2x.png'),
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 8, right: 8, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    exercise[index].title,
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'OpenSans-Bold'),
                  ),
                  //SizedBox(width: 30,),
                  Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 8),
              child: Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Text(
                    exercise[index].duration,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'Poppins-Regular'),
                  )),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Categorypage()));
      },
    );
  }

  Widget bodyexercise(BuildContext context, int index) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(
          right: 10,
        ),
        width: MediaQuery.of(context).size.width * 0.12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(bodypart[index].imgurl),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(begin:Alignment.bottomCenter,end:Alignment.topCenter,colors: [Colors.black,Colors.transparent])),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Text(
                    bodypart[index].title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins'),
                  )
                ],
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Categorypage()));
      },
    );
  }
  Widget productsCard(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        elevation: 5,
        shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.15,
          child: Column(
            children: [
              SizedBox(
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
                        color: Color(0xFF2E7D32),
                        fontFamily: 'Lato-Regular',
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                height: 22,
                width: 65,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CheckOut()));
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
          ),
        ),
      ),
      onTap: () {
        int i = index;
        dynamic data1 = products[index].title;
        dynamic data2 = products[index].duration;
        dynamic data = products[index].imgurl;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDescriptionPage(
                  imgurl: data,
                  title: data1,
                  price: data2,
                  index: i,
                )));
      },
    );
  }

  Widget favoriteWorkoutCard(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width*0.13,
                height: 180,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      favworkout[index].imgurl,
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(width: 5,),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        favworkout[index].title,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.05),

                      Text(
                        favworkout[index].duration,
                        style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Container(
                      width: 220,
                      child: Text(
                        favworkout[index].description,
                        style: TextStyle(fontSize: 15, height: 1.8),
                      )),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(children: [Icon(
                          Icons.play_arrow,
                          color: Colors.red,
                        ),
                          Text(
                            'Play the video',
                            style: TextStyle(fontSize: 10),
                          ),],),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.09,),
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
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//