import 'package:flutter/material.dart';
import 'package:test_app/model/laliga/api.dart';
import 'package:test_app/screens/la_liga/pagebody.dart';

class Laliga extends StatefulWidget {

  @override
  _LaligaState createState() => _LaligaState();
}

class _LaligaState extends State<Laliga> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0.0,
        title: Text(
          "Football Match Result",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),

      body:
      FutureBuilder(
        future: FootballApi().getAllMatches(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            print((snapshot.data).length);
            return PageBody(snapshot.data);
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
