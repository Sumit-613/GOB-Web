import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  fillColor:Color(0x4DFFFFFF),
  filled: true,
  hintText: 'Enter a value',

  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white70, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white70, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),

);
