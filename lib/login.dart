import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'fill_Detail.dart';
import 'Model/user_model.dart';
import 'redux/actions.dart';
import 'constants.dart';
import 'forgot_password.dart';
import 'home1.dart';
import 'register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'Model/app_state.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showSpinner = false;
  bool _isLoggedIn = false;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _formkey = GlobalKey<FormState>();
  String email;
  String password;

  String _getEmail() {
    return FirebaseAuth.instance.currentUser.email;
  }

  Future<bool> _isUserPresent() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('custData')
        .doc(_getEmail())
        .get();
    if (documentSnapshot.exists) {
      return true;
    }

    return false;
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;
      final GoogleAuthCredential googleAuthCredential =
      GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await _auth.signInWithCredential(googleAuthCredential);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      final FacebookAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(result.accessToken.token);
      return await _auth.signInWithCredential(facebookAuthCredential);
    } catch (e) {
      print(e);
      return null;
    }
  }

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

  UserModel dispatchUserEmail(UserCredential firebaseUser) {
    return new UserModel.init('', '', firebaseUser.user.email, '', '', firebaseUser.user.photoURL);
  }
  void _showDialog(Error error) {
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
    return StoreConnector<AppState, Store<AppState>>(
        converter: (store) => store,
        builder: (BuildContext context, Store<AppState> store) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.3),
              child: ModalProgressHUD(
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
                                  height: 70,
                                ),
                                Text('CHARLES GLASS',
                                    style: TextStyle(
                                      fontSize: 29,
                                      fontFamily: 'bell-mt-grassetto',
                                      color: Colors.white,
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'God Father Of Bodybuilding',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white,fontFamily: 'Poppins',fontWeight: FontWeight.w100
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                                Text(
                                  'Welcome Back !',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white,fontFamily: 'OpenSans'),
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  textAlign: TextAlign.start,
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) =>
                                      FocusScope.of(context).nextFocus(),
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
                                  onChanged: (value) {
                                    setState(() {
                                      email = value;
                                    });
                                  },
                                  decoration: kTextFieldDecoration.copyWith(
                                    hintText: 'Enter your email',
                                    hintStyle: TextStyle(
                                        color: Colors.white,fontFamily: 'Poppins'),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  textAlign: TextAlign.start,
                                  textInputAction: TextInputAction.done,
                                  cursorColor: Colors.white,
                                  style: TextStyle(color: Colors.white),
                                  obscureText: true,
                                  validator: (value) => value.length < 6
                                      ? 'Enter A Password Greater Than 6 Chars.'
                                      : null,
                                  onChanged: (value) {
                                    setState(() {
                                      password = value;
                                    });
                                  },
                                  decoration: kTextFieldDecoration.copyWith(
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                        color: Colors.white,fontFamily: 'Poppins'),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ForgotPassword(),
                                            ));
                                      },
                                      padding: EdgeInsets.all(0),
                                      child: Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.white,fontFamily: 'Poppins'
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                    width: double.infinity,

                                    child: MaterialButton(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(40.0)),
                                      onPressed: () async {
                                        if (_formkey.currentState.validate()) {
                                          setState(() {
                                            _showSpinner = true;
                                          });

                                          try {
                                            final user = await _auth
                                                .signInWithEmailAndPassword(
                                                email: email,
                                                password: password);
                                            UserModel userAction =
                                            await dispatchUser(user);
                                            StoreProvider.of<AppState>(context)
                                                .dispatch(
                                                UserLoginAction(userAction));
                                            if (user != null) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => Home1(),
                                                  ));
                                            }
                                            setState(() {
                                              _showSpinner = false;
                                            });
                                          } catch (e) {
                                            _showDialog(e);
                                          }
                                        }
                                      },
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                          ),
                                          child: Text(
                                            "LOGIN",
                                            style: TextStyle(
                                                color: Color(0XFF0d042b),
                                                fontFamily: 'OpenSans',
                                                fontWeight: FontWeight.bold),
                                          )),
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Divider(
                                  color: Colors.white,
                                  endIndent: 100,
                                  indent: 100,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Or Continue with',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14,fontFamily: 'Poppins'
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                FittedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        child: Stack(
                                          children: <Widget>[
                                            Container(
                                                child: RaisedButton(
                                                  onPressed: () async {
                                                    try {
                                                      final user =
                                                      await signInWithGoogle();
                                                      if (user != null) {
                                                        bool userPresent =
                                                        await _isUserPresent();
                                                        if (userPresent) {
                                                          UserModel userAction =
                                                          await dispatchUser(
                                                              user);
                                                          StoreProvider.of<AppState>(
                                                              context)
                                                              .dispatch(
                                                              UserLoginAction(
                                                                  userAction));
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) =>
                                                                    Home1(),
                                                              ));
                                                        } else {
                                                          UserModel userAction =
                                                          dispatchUserEmail(user);
                                                          StoreProvider.of<AppState>(
                                                              context)
                                                              .dispatch(
                                                              UserLoginAction(
                                                                  userAction));
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) =>
                                                                    FillDetail(),
                                                              ));
                                                        }
                                                      }
                                                      setState(() {
                                                        _showSpinner = false;
                                                      });
                                                    } catch (e) {
                                                      print(e);
                                                      _showDialog(e);
                                                    }
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(left: 20),
                                                    child: Text(
                                                      "GOOGLE ",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 30, vertical: 15),
                                                  color: Color(0x4DFFFFFF),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(30)),
                                                )),
                                            Positioned(
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                backgroundImage: AssetImage(
                                                    "assets/images.png"),
                                                radius: 20,
                                              ),
                                              left: 3,
                                              top: 4,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        child: Stack(
                                          children: <Widget>[
                                            Container(
                                              child: RaisedButton(
                                                onPressed: () async {
                                                  try {
                                                    final user =
                                                    await signInWithFacebook();
                                                    if (user != null) {
                                                      bool userPresent =
                                                      await _isUserPresent();
                                                      if (userPresent) {
                                                        UserModel userAction =
                                                        await dispatchUser(
                                                            user);
                                                        StoreProvider.of<
                                                            AppState>(context)
                                                            .dispatch(
                                                            UserLoginAction(
                                                                userAction));
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                  Home1(),
                                                            ));
                                                      } else {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  FillDetail(),
                                                            ));
                                                      }
                                                    }
                                                    setState(() {
                                                      _showSpinner = false;
                                                    });
                                                  } catch (e) {
                                                    _showDialog(e);
                                                  }
                                                },
                                                child: Container(
                                                  margin:
                                                  EdgeInsets.only(left: 20),
                                                  child: Text(
                                                    "FACEBOOK ",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 30, vertical: 15),
                                                color: Color(0x4DFFFFFF),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        30)),
                                              ),
                                            ),
                                            Positioned(
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                backgroundImage: AssetImage(
                                                    'assets/facebook.png'),
                                                radius: 20,
                                              ),
                                              left: 3,
                                              top: 4,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 20),
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Don\'t have an account? ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11,fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600)),
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Register(),
                                                ));
                                          },
                                          padding: EdgeInsets.only(right: 10),
                                          child: Text('Register Here',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                TextDecoration.underline,
                                              )),
                                        )
                                      ],
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
            ),
          );
        });
  }
}
