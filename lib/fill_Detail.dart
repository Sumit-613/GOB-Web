import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gob_app/Model/user_model.dart';
import 'package:gob_app/redux/actions.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:gob_app/home1.dart';
import 'constants.dart';
import 'Model/app_state.dart';

class FillDetail extends StatefulWidget {
  @override
  _FillDetailState createState() => _FillDetailState();
}

class _FillDetailState extends State<FillDetail> {
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
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      )
      .toList();

  final _firestore = FirebaseFirestore.instance;
  String _btn2SelectedVal;
  String name;
  String phNo;
  String email;
  String age;
  bool _showSpinner = false;
  final _formkey = GlobalKey<FormState>();
  PickedFile _image;

  Future<UserModel> dispatchUser(UserCredential firebaseUser) async {
    UserModel user = new UserModel();
    User userInfo = firebaseUser.user;
    await _firestore
        .collection('custData')
        .doc(userInfo.email)
        .get()
        .then((DocumentSnapshot snapshot) async {
      dynamic data = snapshot.data();
      user.fullName = data['name'];
      user.email = data['email'];
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
      _image = pickedImage;
    });
  }

  Future<String> uploadImage() async {
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

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserModel>(
        onInit: (store) {
          email = store.state.getUser().email;
        },
        converter: (store) => store.state.getUser(),
        builder: (BuildContext context, UserModel user) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: ModalProgressHUD(
              inAsyncCall: _showSpinner,
              child: SafeArea(
                child: SizedBox.expand(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Group 279@2x.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Form(
                        key: _formkey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                'Fill Your Info',
                                style: TextStyle(fontFamily: 'Lato Bold',
                                    fontSize: 25, color: Colors.white),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              FlatButton(
                                child: CircleAvatar(
                                    radius: 40,
                                    backgroundImage: _image == null
                                        ? NetworkImage(
                                            'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png')
                                        : FileImage(File((_image.path)))),
                                onPressed: () async {
                                  await chooseImage();
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Edit Profile',
                                style: TextStyle(
                                  fontSize: 15, color: Colors.white,fontFamily: 'Poppins',),
                              ),
                              SizedBox(
                                height: 55,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                textAlign: TextAlign.start,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) =>
                                    FocusScope.of(context).nextFocus(),
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
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
                                  hintStyle: TextStyle(color: Colors.white,fontFamily: 'Poppins',),
                                ),
                                // initialValue: user.fullName
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.start,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                validator: (value) => value.length < 10
                                    ? 'Please Enter A 10 Digit Valid Mobile Number'
                                    : null,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) =>
                                    FocusScope.of(context).nextFocus(),
                                onChanged: (value) {
                                  setState(() {
                                    phNo = value;
                                  });
                                },
                                decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Your Mobile Number*',
                                  hintStyle: TextStyle(color: Colors.white,fontFamily: 'Poppins',),
                                ),
                                // initialValue: user.phNo
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                textAlign: TextAlign.start,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                validator: (value) {
                                  RegExp emailRegEx =
                                      new RegExp(r'^\S+@\S+[\.][0-9a-z]+$');
                                  if (value.isEmpty) {
                                    return 'Enter an Email';
                                  } else if (!emailRegEx.hasMatch(value)) {
                                    return 'Enter a valid Email';
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (_) =>
                                    FocusScope.of(context).nextFocus(),
                                onChanged: (value) {
                                  setState(() {
                                    email = value;
                                  });
                                },
                                decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Your Email*',
                                  hintStyle: TextStyle(color: Colors.white,fontFamily: 'Poppins',),
                                ),
                                initialValue: user.email,
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 16, right: 16),
                                decoration: BoxDecoration(
                                    color: Color(0x4DFFFFFF),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Colors.white,
                                    )),
                                child: DropdownButtonFormField(
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                  ),
                                  iconSize: 20,
                                  iconEnabledColor: Colors.white,
                                  isExpanded: true,
                                  dropdownColor: Colors.grey,
                                  style: TextStyle(color: Colors.white),
                                  value: _btn2SelectedVal,
                                  validator: (value) => value == null
                                      ? 'Please Fill In Your Gender'
                                      : null,
                                  hint: Text(
                                    'Select Your Gender*',
                                    style: TextStyle(color: Colors.white,fontFamily: 'Poppins',),
                                  ),
                                  onChanged: ((String newValue) {
                                    setState(() {
                                      _btn2SelectedVal = newValue;

                                      FocusScope.of(context).nextFocus();
                                    });
                                  }),
                                  items: _dropDownMenuItems,
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.start,
                                cursorColor: Colors.white,
                                textInputAction: TextInputAction.done,
                                style: TextStyle(color: Colors.white),
                                validator: (value) => value.isEmpty
                                    ? 'Please Enter Your Age'
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    age = value;
                                  });
                                },
                                decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Your age*',
                                  hintStyle: TextStyle(color: Colors.white,fontFamily: 'Poppins',),
                                ),
                                // initialValue: user.age
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: MaterialButton(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(40.0)),
                                  onPressed: () async {
                                    String fileURL;
                                    if (_formkey.currentState.validate()) {
                                      setState(() {
                                        _showSpinner = true;
                                      });
                                      try {
                                        if (_image != null) {
                                          fileURL = await uploadImage();
                                        }
                                        StoreProvider.of<AppState>(context)
                                            .dispatch(UserLoginAction(
                                                new UserModel.init(
                                                    name,
                                                    phNo,
                                                    email,
                                                    _btn2SelectedVal,
                                                    age,
                                                    fileURL)));
                                        await _firestore
                                            .collection('custData')
                                            .doc(email)
                                            .set({
                                          'name': name,
                                          'phoneNo': phNo,
                                          'email': email,
                                          'gender': _btn2SelectedVal,
                                          'age': age,
                                          'photoURL': fileURL,
                                        });
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Home1(),
                                            ));
                                        setState(() {
                                          _showSpinner = false;
                                        });
                                      } catch (e) {
                                        _showDialog(context, e);
                                      }
                                    }
                                  },
                                  child: Text(
                                    "SUBMIT",
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'OpenSans'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
