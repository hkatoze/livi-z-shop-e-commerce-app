import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liviz_shop/constants.dart';
import 'package:liviz_shop/screens/cart/cartscreen.dart';
import 'package:liviz_shop/screens/favorite/favoriteScreen.dart';
import 'package:liviz_shop/screens/home/home_screen.dart';
import 'package:liviz_shop/screens/myOrderScreen/myOrderScreen.dart';
import 'package:liviz_shop/screens/profil/profilScreen.dart';
import 'package:liviz_shop/screens/seetingsScreen/seetingsScreen.dart';
import 'package:liviz_shop/screens/walletsScreen/walletsScreen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final _pageController = PageController(
    initialPage: 0,
    keepPage: true,
    viewportFraction: 1.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Homescreen(),
          MyCartScreen(),
          FavoriteScreen(),
          ProfilScreen()
        ],
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
      bottomNavigationBar: BottomAppBar(
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
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
                _pageController.animateToPage(0,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.cartArrowDown,
                color: _selectedIndex == 1 ? primaryColor : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
                _pageController.animateToPage(1,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.heart,
                color: _selectedIndex == 2 ? primaryColor : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
                _pageController.animateToPage(2,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.user,
                color: _selectedIndex == 3 ? primaryColor : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 3;
                });
                _pageController.animateToPage(3,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    });
  }
}

class DrawerManagement extends StatefulWidget {
  const DrawerManagement({super.key});

  @override
  State<DrawerManagement> createState() => _DrawerManagementState();
}

class _DrawerManagementState extends State<DrawerManagement> {
  MenuItem currentItem = MenuItems.shop;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
          style: DrawerStyle.defaultStyle,
          drawerShadowsBackgroundColor: Color.fromARGB(0, 240, 239, 239),
          showShadow: true,
          borderRadius: 40.0,
          angle: 0.0,
          duration: Duration(milliseconds: 500),
          reverseDuration: Duration(milliseconds: 500),
          openCurve: Curves.fastOutSlowIn,
          closeCurve: Curves.fastOutSlowIn,
          menuBackgroundColor: bgColor,
          slideWidth: MediaQuery.of(context).size.width * 0.65,
          moveMenuScreen: false,
          menuScreen: Builder(
            builder: (context) => MenuScreen(
                currentItem: currentItem,
                onSelectedItem: (item) {
                  setState(() {
                    currentItem = item;
                  });

                  ZoomDrawer.of(context)!.close();
                }),
          ),
          mainScreen: getScreen()),
    );
  }

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.shop:
        return MainScreen();
      case MenuItems.wallet:
        return WalletsScreen();
      case MenuItems.myOrder:
        return MyOrderScreen();
      case MenuItems.about:
        return Container();
      case MenuItems.policy:
        return Container();
      case MenuItems.settings:
        return SeetingsScreen();
      case MenuItems.logout:
      default:
        return Container();
    }
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen(
      {super.key, required this.currentItem, required this.onSelectedItem});
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 218, 216, 216),
                      child: Container(
                        height: 70,
                        width: 70,
                        child: ClipOval(
                          child: Image.asset(
                            "assets/images/profil.jpg",
                            scale: 30,
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      "Harouna Kinda",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Developpeur mobile",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          ...MenuItems.all.map(buildMenuItem).toList(),
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/logo.jpg",
                  scale: 7,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                Text(
                  "Livi'z Boutik",
                  style: GoogleFonts.quando(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          )
        ],
      )),
    );
  }

  Widget buildMenuItem(MenuItem item) => GestureDetector(
        onTap: () => onSelectedItem(item),
        child: Column(
          children: [
            if (item.libelle == "Logout") MenuItemDivider(),
            MenuItemCard(
                icon: item.icon,
                libelle: item.libelle,
                isActive: currentItem == item),
            MenuItemDivider(),
          ],
        ),
      );
}

class MenuItemCard extends StatelessWidget {
  const MenuItemCard(
      {super.key,
      required this.icon,
      required this.libelle,
      required this.isActive});

  final IconData icon;
  final String libelle;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: [
        Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primaryColor.withOpacity(0.2)),
            child: Center(
              child: Icon(
                icon,
                color: primaryColor,
                size: 17,
              ),
            )),
        SizedBox(
          width: 10,
        ),
        Text(
          "${libelle}",
          style: TextStyle(
              fontSize: 16,
              fontWeight: isActive ? FontWeight.w500 : FontWeight.normal),
        )
      ]),
    );
  }
}

class MenuItem {
  const MenuItem(this.icon, this.libelle, this.isActive);

  final IconData icon;
  final String libelle;
  final bool isActive;
}

class MenuItems {
  static const shop = MenuItem(Icons.shop, "Boutique", true);
  static const wallet = MenuItem(Icons.wallet, "Wallet", false);
  static const myOrder =
      MenuItem(FontAwesomeIcons.cartArrowDown, "My Orders", false);
  static const about = MenuItem(Icons.help, "About Us", false);
  static const policy = MenuItem(Icons.lock, "Privacy Policy", false);
  static const settings = MenuItem(Icons.settings, "Settings", false);
  static const logout = MenuItem(Icons.logout, "Logout", false);

  static const all = <MenuItem>[
    shop,
    wallet,
    myOrder,
    about,
    policy,
    settings,
    logout
  ];
}
