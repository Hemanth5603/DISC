import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

import 'FeaturesPg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedindex = 0;
  int currentIndex = 0;
  PageController controller = PageController(initialPage: 0);
  List tabs = [
    Center(
      child: FeaturesPg(),
    ),
    Center(
      child: Text('Events'),
    ),
    Center(
      child: Text('Profile'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    dynamic height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: tabs[selectedindex],
          ),
          bottomNavigationBar: FlashyTabBar(
            showElevation: true,
            selectedIndex: selectedindex,
            animationCurve: Curves.easeInCubic,
            onItemSelected: (index) {
              setState(() {
                selectedindex = index;
              });
            },
            backgroundColor: Colors.black,
            height: height * 0.08,
            iconSize: height * 0.02,
            items: [
              FlashyTabBarItem(
                icon: Icon(
                  Icons.star_rounded,
                  color: Colors.white,
                  size: height * 0.03,
                ),
                title: Text(
                  'Featured',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              FlashyTabBarItem(
                icon: Icon(
                  Icons.turned_in_rounded,
                  color: Colors.white,
                  size: height * 0.03,
                ),
                title: Text(
                  'Events',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              FlashyTabBarItem(
                icon: Icon(
                  Icons.person,
                  size: height * 0.03,
                  color: Colors.white,
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )),
    );
  }
}
