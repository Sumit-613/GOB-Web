import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gob_app/Model/user_model.dart';
import 'package:gob_app/home1.dart';
import 'package:gob_app/login.dart';
import 'package:redux_persist/redux_persist.dart';
import 'Model/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'redux/reducers.dart';
import 'package:flutter/services.dart';
import 'splash_screen.dart';
import 'package:path_provider/path_provider.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;

Future<UserModel> dispatchUser(String email) async {
  UserModel user = new UserModel();
  await _firestore
      .collection('custData')
      .doc(email)
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp();

  // final Directory directory = await getApplicationDocumentsDirectory();
  // final String path = directory.path;
  // File stateFile = await File("$path/prevState.json").create(recursive: true);

  // final persistor = Persistor<AppState>(
  //     storage: FileStorage(stateFile),
  //     serializer: JsonSerializer<AppState>(AppState.fromJson),
  //     debug: true);

  AppState _initialState;

  // try {
  //   _initialState = await persistor.load();
  // } catch (e) {
  //   print(e);
  //   _initialState = null;
  // }

  final Store<AppState> store = new Store<AppState>(
    appReducers,
    initialState: _initialState ?? new AppState(),
    // middleware: [persistor.createMiddleware()],
  );

  runApp(new GOB(store));
}

class GOB extends StatelessWidget {
  final Store<AppState> store;
  GOB(this.store);
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'God Father Of Body Building',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser == null) {
      Timer(
          Duration(seconds: 5),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => Home1())));
    } else {
      Timer(
          Duration(seconds: 5),
          () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => Home1())));
    }
    return SplashScreen();
  }
}
