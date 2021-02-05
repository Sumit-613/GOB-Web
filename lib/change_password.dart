import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gob_app/Model/app_state.dart';
import 'package:gob_app/login.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _showSpinner = false;
  String password1;
  String password2;
  final _formkey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future _changePassword(String email, String password) async {
    User user = _auth.currentUser;
    if (user == null) {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      User newUser = _auth.currentUser;
      await newUser.updatePassword(password);
      await _auth.signOut();
    }
    user.updatePassword(password).then((_) async {
      print("Password Change Success");
      await _auth.signOut();
    }).catchError((error) {
      print("Password Can't Be Changed: " + error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
      converter: (store) => store.state.forgotPasswordEmail(),
      builder: (BuildContext context, String forgotPasswordEmail) {
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
                      child:
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 45,
                            ),
                            Container(
                              alignment: Alignment(-0.99, 0.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 65,
                                  ),
                                  Text(
                                    'Change Password',
                                    style: TextStyle(
                                        fontFamily: 'Lato-Bold',
                                        fontSize: 18,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            Text(
                                'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy. ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300)),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              obscureText: true,
                              textAlign: TextAlign.start,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              validator: (value) => value.length < 6
                                  ? 'Enter A Password Greater Than 6 Chars.'
                                  : null,
                              onChanged: (value) {
                                setState(() {
                                  password1 = value;
                                });
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                hintText: 'New Password',
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              obscureText: true,
                              textAlign: TextAlign.start,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              validator: (value) => password1 != password2
                                  ? 'New Password Didnt Match'
                                  : null,
                              onChanged: (value) {
                                setState(() {
                                  password2 = value;
                                });
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Confirm New Password',
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: MaterialButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0)),
                                onPressed: () async {
                                  setState(() {
                                    if (_formkey.currentState.validate()) {
                                      _showSpinner = true;
                                    }
                                  });
                                  await _changePassword(
                                      forgotPasswordEmail, password1);
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              LoginScreen()));
                                  setState(() {
                                    _showSpinner = false;
                                  });
                                },
                                child: Text(
                                  "CONFIRM",
                                  style: TextStyle(color: Color(0XFF0d042b),),
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
          );
      },
    );
  }
}
