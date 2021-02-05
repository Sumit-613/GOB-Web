import 'package:flutter/material.dart';
import 'package:circular_check_box/circular_check_box.dart';

class List_Tile extends StatefulWidget {
  dynamic imgurl;
  dynamic title;

  List_Tile({this.imgurl,this.title});
  @override
  _List_TileState createState() => _List_TileState();
}

class _List_TileState extends State<List_Tile> {

  bool addselcted=false;
  bool ischecked=false;
  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(onTap: (){setState(() {
          addselcted=!addselcted;
        });},
          child: Card(shape:(addselcted==true)? new RoundedRectangleBorder(
              side: new BorderSide(color: Colors.red, width: 2.0),
              borderRadius: BorderRadius.circular(4.0)):new RoundedRectangleBorder(
              side: new BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(4.0)),
              child: ListTile(leading: Container(height: 40,width: 40,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(widget.imgurl,),
                  ],
                ),
              ),
                title: Text(
                  widget.title,
                  style: TextStyle(
                      fontFamily: 'OpenSans-SemiBold',
                      color: Color(0XFF0d042b)),
                ),

                trailing: Container(height: 28,width: 28,decoration: BoxDecoration(
                    border: Border.all(color:(ischecked==false)? Colors.transparent:Colors.lightGreen),borderRadius: BorderRadius.circular(20)
                ),
                  child: CircularCheckBox(
                    value: ischecked,
                    checkColor: Colors.lightGreen,
                    onChanged: (newValue) {

                      setState(() {
                        ischecked=!ischecked;
                      });
                    },
                    activeColor: Colors.white,
                  ),
                ),
              )),
        ));
  }
}
