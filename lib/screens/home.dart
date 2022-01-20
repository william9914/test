import 'package:flutter/material.dart';
import 'package:test_app/model/premier_league/api.dart';
import 'package:test_app/screens/premier_league/pagebody.dart';
import 'package:test_app/screens/premier_league/home_premier_league.dart';
import 'package:test_app/screens/la_liga/home_laliga.dart';
import 'package:test_app/screens/serie_a/home_serie_a.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
  with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

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
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          tabs: const <Widget>[
            Tab(
              child: Text("Premier League"),
            ),
            Tab(
              child: Text("La Liga"),
            ),
            Tab(
              child: Text("Serie A"),
            ),
          ],
        ),
      ),

      body:

        TabBarView(
          controller: _tabController,
          children: [
            PremierLeague(),
            Laliga(),
            SerieA(),
          ],
        ),
    );
  }
}
