import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Group 279@2x.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('CHARLES GLASS',
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'bell-mt-grassetto',
                      color: Colors.white,
                    )),
                Divider(
                  color: Colors.white,
                  endIndent: 125,
                  indent: 125,
                ),
                Text(
                  'God Father Of Bodybuilding',
                  style: TextStyle(fontSize: 15, color: Colors.white,fontFamily: 'Poppins',fontWeight: FontWeight.w100),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

