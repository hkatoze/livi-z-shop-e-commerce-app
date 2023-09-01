import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFa0185a);
const Color bgColor = Color(0xFFFBFBFD);

const double defaultPadding = 16.0;
const double defaultBorderRadius = 12.0;

class MenuItemDivider extends StatelessWidget {
  const MenuItemDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.04,
    );
  }
}
