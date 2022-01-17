import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:test_app/screens/home.dart';

import 'home.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: List.generate(4, (index) => Home()),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).primaryColor,
          primaryColor: Theme.of(context).primaryColorDark,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.black),
              ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Feather.bookmark,
              ),
              label: 'Result',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Feather.file,
              ),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Feather.user,
              ),
              label: 'User',
            ),
          ],
          onTap: navigationTapped,
          selectedItemColor: Colors.white,
          currentIndex: _page,
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 2);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
