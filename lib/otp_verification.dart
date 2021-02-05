import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'change_password.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './Model/app_state.dart';
import './redux/actions.dart';

class OtpVerification extends StatefulWidget {
  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  String verificationID;
  String code;

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(30.0),
    );
  }

  void sendOTP(String phoneNo) async {
    _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: Duration(seconds: 120),
        verificationCompleted: (AuthCredential credential) async {
          UserCredential result = await _auth.signInWithCredential(credential);
          User user = result.user;
          if (user == null) {
            print("Error");
          }
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception);
        },
        codeSent: (String _verificationId, [int forceResendingToken]) {
          verificationID = _verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  Future<String> getNumber(String email) async {
    DocumentSnapshot snapshot =
        await _firestore.collection('custData').doc(email).get();
    if (snapshot.exists) {
      return snapshot.data()['phoneNo'];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        onInit: (store) async {
          String phoneNumber =
              await getNumber(store.state.forgotPasswordEmail());
          this.sendOTP(phoneNumber);
        },
        converter: (store) => store.state,
        builder: (BuildContext context, AppState state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
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
                                    'OTP Verification',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white,fontFamily: 'Lato Bold'),
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
                                    fontWeight: FontWeight.w300)),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              color: null,
                              margin: const EdgeInsets.all(10.0),
                              padding: const EdgeInsets.all(10.0),
                              child: PinPut(
                                fieldsCount: 6,
                                onSubmit: (String pin) => setState(() {
                                  code = pin;
                                }),
                                focusNode: _pinPutFocusNode,
                                controller: _pinPutController,
                                submittedFieldDecoration:
                                    _pinPutDecoration.copyWith(
                                  color: Color(0x4DFFFFFF),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                selectedFieldDecoration: _pinPutDecoration,
                                followingFieldDecoration:
                                    _pinPutDecoration.copyWith(
                                  color: Color(0x4DFFFFFF),
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(.5),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: MaterialButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0)),
                                onPressed: () async {
                                  AuthCredential credential =
                                      PhoneAuthProvider.credential(
                                          verificationId: verificationID,
                                          smsCode: code);

                                  // UserCredential result = await _auth
                                  //     .signInWithCredential(credential);

                                  // User user = result.user;

                                  if (credential != null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChangePassword()));
                                  } else {
                                    //Dialog incorrect OTP
                                    print("Error");
                                  }
                                },
                                child: Text(
                                  "CONFIRM",
                                  style: TextStyle(
                                      color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'OpenSans'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                'Resend OTP',
                                style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,fontFamily: 'Poppins'),
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          top: 33,
                          right: 228,
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
                ),
              ),
            ),
          );
        });
  }
}

void _showSnackBar(String pin, BuildContext context) {
  final snackBar = SnackBar(
    duration: const Duration(seconds: 3),
    content: Container(
      height: 80.0,
      child: Center(
        child: Text(
          'Pin Submitted. Value: $pin',
          style: const TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    ),
    backgroundColor: Colors.white,
  );
  Scaffold.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
