import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:liviz_shop/constants.dart';
import 'package:liviz_shop/models/cartProduct.dart';
import 'package:liviz_shop/screens/cart/components/cartProductCard.dart';
import 'package:liviz_shop/screens/cart/components/myCartProducts.dart';

class MyOrderScreen extends StatelessWidget {
  MyOrderScreen();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                ZoomDrawer.of(context)!.toggle();
              },
              icon: SvgPicture.asset("assets/icons/menu.svg"),
            ),
            centerTitle: true,
            title: Text(
              "Mes Commandes",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          body: Container(
            margin: const EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(tabs: [
                  Tab(
                    child: Text(
                      "Validées",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Annulées",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ),
                ]),
                Expanded(
                    child: TabBarView(children: [
                  //Commands completed
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.65,
                            child: ListView.builder(
                              itemCount: demo_cartproduct.length,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(
                                    right: defaultPadding),
                                child: MyOrderProductCard(
                                  title: demo_cartproduct[index].title,
                                  image: demo_cartproduct[index].image,
                                  price: demo_cartproduct[index].price,
                                  bgColor: demo_cartproduct[index].bgColor,
                                  quantity: demo_cartproduct[index].quantity,
                                  press: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Container(),
                                        ));
                                  },
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  //Commands Cancelled
                  Container(
                    child: Center(
                        child: Text("Les commandes annulées apparaîtront ici")),
                  )
                ]))
              ],
            ),
          ),
        ));
  }
}

class MyOrderProductCard extends StatefulWidget {
  const MyOrderProductCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.price,
      required this.press,
      required this.bgColor,
      required this.quantity})
      : super(key: key);
  final String image, title;
  final VoidCallback press;
  final int price;
  final Color bgColor;
  final int quantity;

  @override
  State<MyOrderProductCard> createState() => _MyOrderProductCardState();
}

class _MyOrderProductCardState extends State<MyOrderProductCard> {
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
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius:
                  const BorderRadius.all(Radius.circular(defaultBorderRadius)),
            ),
            child: Image.asset(
              widget.image,
              height: 70,
              width: 70,
            ),
          ),
          const SizedBox(width: defaultPadding / 2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: defaultPadding / 4),
              Text(
                "\$" + widget.price.toString(),
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
          Expanded(child: Container()),
          Container(
            child: Text(
              "Aujourd'hui",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          )
        ],
      ),
    );
  }
}
