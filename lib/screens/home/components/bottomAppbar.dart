import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liviz_shop/constants.dart';

class MyBottomAppBar extends StatefulWidget {
  @override
  _MyBottomAppBarState createState() => _MyBottomAppBarState();
}

class _MyBottomAppBarState extends State<MyBottomAppBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.house,
              color: _selectedIndex == 0 ? primaryColor : Colors.grey,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.cartArrowDown,
              color: _selectedIndex == 1 ? primaryColor : Colors.grey,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.heart,
              color: _selectedIndex == 2 ? primaryColor : Colors.grey,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.user,
              color: _selectedIndex == 3 ? primaryColor : Colors.grey,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
