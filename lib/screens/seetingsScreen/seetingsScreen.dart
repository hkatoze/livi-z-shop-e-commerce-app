import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:liviz_shop/constants.dart';
import 'package:liviz_shop/models/cartProduct.dart';
import 'package:liviz_shop/screens/cart/components/cartProductCard.dart';
import 'package:liviz_shop/screens/cart/components/myCartProducts.dart';

class SeetingsScreen extends StatelessWidget {
  SeetingsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              ZoomDrawer.of(context)!.toggle();
            },
            icon: SvgPicture.asset("assets/icons/menu.svg"),
          ),
          centerTitle: true,
          title: Text(
            "Seetings",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(defaultPadding),
            physics: BouncingScrollPhysics(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SeetingsItem(
                icon: Icons.email,
                withSwitch: false,
                title: "Email Support",
                onPress: () {},
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SeetingsItem(
                icon: Icons.help_rounded,
                withSwitch: false,
                title: "Faq",
                onPress: () {},
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SeetingsItem(
                icon: Icons.lock,
                withSwitch: false,
                title: "Privacy Statements",
                onPress: () {},
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SeetingsItem(
                title: "Notification",
                withSwitch: true,
                icon: Icons.notifications,
                onPress: () {},
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SeetingsItem(
                title: "Update",
                icon: Icons.upgrade,
                withSwitch: true,
                onPress: () {},
              )
            ])));
  }
}

class SeetingsItem extends StatefulWidget {
  const SeetingsItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.withSwitch,
      required this.onPress});
  final IconData? icon;
  final String title;
  final bool withSwitch;
  final VoidCallback onPress;

  @override
  State<SeetingsItem> createState() => _SeetingsItemState();
}

class _SeetingsItemState extends State<SeetingsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(defaultPadding / 2),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
      ),
      child: Row(
        children: [
          Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryColor.withOpacity(0.2)),
              child: Center(
                child: Icon(
                  widget.icon,
                  color: primaryColor,
                  size: 17,
                ),
              )),
          SizedBox(
            width: 20,
          ),
          Text(
            widget.title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          ),
          Expanded(child: Container()),
          if (widget.withSwitch == false)
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          if (widget.withSwitch) Switch(value: true, onChanged: (value) {})
        ],
      ),
    );
  }
}
