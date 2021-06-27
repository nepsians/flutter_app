import 'package:flutter/material.dart';
import 'package:flutter_app/screens/settings/setting_screen.dart';
import 'package:flutter_app/screens/weather/index.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

enum OptionsMenu { changeCity, settings }

class HomeScreen extends StatefulWidget {
  static final routeName = "/home_screen";

  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    WeatherScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: bottomNavBar(context),
    );
  }

  Container bottomNavBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.86),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Theme.of(context).accentColor.withOpacity(.15),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Theme.of(context).accentColor.withAlpha(10),
            hoverColor: Theme.of(context).accentColor.withAlpha(10),
            gap: 8,
            activeColor: Theme.of(context).accentColor.withOpacity(0.8),
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Theme.of(context).accentColor.withAlpha(20),
            color: Theme.of(context).accentColor.withOpacity(0.8),
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            tabs: [
              GButton(
                icon: LineIcons.sun,
                text: 'Weather',
              ),
              GButton(
                icon: LineIcons.cog,
                text: 'Settings',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
