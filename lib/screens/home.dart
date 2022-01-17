import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:test_app/model/api.dart';
import 'package:test_app/screens/pagebody.dart';
import 'package:test_app/util/const.dart';
import 'package:test_app/util/data.dart';
import 'package:test_app/widgets/badge.dart';
import 'package:test_app/widgets/search_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

      body: FutureBuilder(
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
