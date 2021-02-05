import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'Model/app_state.dart';
import 'otp_verification.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'redux/actions.dart';
import 'constants.dart';
import 'change_password.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String phoneNo;
  String code;
  final _formkey = GlobalKey<FormState>();
  bool _showSpinner = false;

  Future<bool> verUser(String phoneNo, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: Duration(seconds: 120),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();

          UserCredential result = await _auth.signInWithCredential(credential);

          User user = result.user;

          if (user != null) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChangePassword()));
          } else {
            print("Error");
          }
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => OtpVerification()));
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
    return true;
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
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (BuildContext context, AppState state) {
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
                      child: Stack(
                        children: [
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: 45,
                              ),
                              Container(
                                alignment: Alignment(-0.99, 0.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 80,
                                    ),
                                    Text(
                                      'Forgot Password',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white,fontFamily: 'Lato'),
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
                                      color: Colors.white,
                                      fontSize: 14,fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                  )),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                child: Form(
                                  key: _formkey,
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    textAlign: TextAlign.start,
                                    cursorColor: Colors.white,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins-Regular',
                                    ),
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
                                        phoneNo = value;
                                      });
                                    },
                                    decoration: kTextFieldDecoration.copyWith(
                                      hintText: 'Enter Your Email address',
                                      hintStyle: TextStyle(
                                        color: Colors.white,fontSize: 14,fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
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
                                    if (_formkey.currentState.validate()) {
                                      setState(() {
                                        _showSpinner = true;
                                      });
                                      try {
                                        StoreProvider.of<AppState>(context)
                                            .dispatch(
                                                SetForgotPasswordEmailAction(
                                                    phoneNo));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    OtpVerification()));

                                        setState(() {
                                          _showSpinner = false;
                                        });
                                      } catch (e) {
                                        _showDialog(context, e);
                                      }
                                    }
                                  },
                                  child: Text(
                                    "PROCEED",
                                    style: TextStyle(
                                        color: Color(0XFF0d042b),
                                        fontFamily: 'OpenSans-Bold',fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 33,
                            right: MediaQuery.of(context).size.width*0.6,
                            child: FlatButton(
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    /* add child content here */
                  ),
                ),
              ),
            ),
          );
        });
  }
}
