import 'package:flutter/material.dart';
import 'Constants/constants.dart';

class AddNewAddress extends StatelessWidget {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final pinCodeController = TextEditingController();
  final flatController = TextEditingController();
  final areaController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
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
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.23),
            width: MediaQuery.of(context).size.width * 0.92,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ADD NEW ADDRESS',
                  style: TextStyle(
                      color: Color(0XFF0d042b),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      fontSize: 20),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.start,
                  cursorColor: Colors.black,
                  style: TextStyle(
                      color: Colors.black, fontSize: 18, fontFamily: 'Poppins'),
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Your Full Name',
                    hintStyle: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.start,
                  cursorColor: Colors.black,
                  style: TextStyle(
                      color: Colors.black, fontSize: 18, fontFamily: 'Poppins'),
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Mobile Number',
                    hintStyle: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: pinCodeController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.start,
                  cursorColor: Colors.black,
                  style: TextStyle(
                      color: Colors.black, fontSize: 18, fontFamily: 'Poppins'),
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Pincode',
                    hintStyle: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: flatController,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.start,
                  cursorColor: Colors.black,
                  style: TextStyle(
                      color: Colors.black, fontSize: 18, fontFamily: 'Poppins'),
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Flat, House no.',
                    hintStyle: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: areaController,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.start,
                  cursorColor: Colors.black,
                  style: TextStyle(
                      color: Colors.black, fontSize: 18, fontFamily: 'Poppins'),
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Area, Colony, Street',
                    hintStyle: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: cityController,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.start,
                  cursorColor: Colors.black,
                  style: TextStyle(
                      color: Colors.black, fontSize: 18, fontFamily: 'Poppins'),
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Town, City',
                    hintStyle: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: stateController,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.start,
                  cursorColor: Colors.black,
                  style: TextStyle(
                      color: Colors.black, fontSize: 18, fontFamily: 'Poppins'),
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'State',
                    hintStyle: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: countryController,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.start,
                  cursorColor: Colors.black,
                  style: TextStyle(
                      color: Colors.black, fontSize: 18, fontFamily: 'Poppins'),
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Country',
                    hintStyle: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  margin:
                      EdgeInsets.only(top: 10, bottom: 5, left: 60, right: 60),
                  width: double.infinity,
                  child: MaterialButton(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                      child: Text(
                        "ADD ADDRESS",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
