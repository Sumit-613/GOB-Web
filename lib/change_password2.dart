import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:gob_app/Model/app_state.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home1.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ChangePassword2 extends StatefulWidget {
  @override
  _ChangePassword2State createState() => _ChangePassword2State();
}

class _ChangePassword2State extends State<ChangePassword2> {
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
                        Column(
                          children: [
                            SizedBox(
                              height: 45,
                            ),
                            Container(
                              child: Row(

                                children: [
                                  SizedBox(
                                    width: 55,
                                  ),
                                  IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: (){
                                    Navigator.pop(context);
                                  }),
                                  SizedBox(width: 10,),

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
                           Container(padding: EdgeInsets.symmetric(horizontal:450),
                             child: Column(children: [
                               Text(
                                   'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy. ',
                                   textAlign: TextAlign.center,
                                   style: TextStyle(
                                       fontFamily: 'Poppins-Regular',
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
                                       fontFamily: 'Poppins-Regular'),
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
                                       fontFamily: 'Poppins-Regular'),
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
                                     if (_formkey.currentState.validate()) {
                                       setState(() {
                                         _showSpinner = true;
                                       });

                                       try {
                                         await _changePassword(
                                             forgotPasswordEmail, password1);
                                         Navigator.of(context).pushReplacement(
                                             MaterialPageRoute(
                                                 builder: (BuildContext context) =>
                                                     Home1()));
                                         setState(() {
                                           _showSpinner = false;
                                         });
                                       } catch (e) {
                                         _showDialog(context, e);
                                       }
                                     }
                                   },
                                   child: Text(
                                     "CONFIRM",
                                     style: TextStyle(color: Colors.black),
                                   ),
                                 ),
                               ),
                             ],),
                           )
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
