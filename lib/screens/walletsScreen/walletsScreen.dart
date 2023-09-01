import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:liviz_shop/constants.dart';
import 'package:liviz_shop/models/cartProduct.dart';
import 'package:liviz_shop/models/transactionItem.dart';
import 'package:liviz_shop/screens/cart/components/cartProductCard.dart';
import 'package:liviz_shop/screens/cart/components/myCartProducts.dart';

class WalletsScreen extends StatefulWidget {
  const WalletsScreen({super.key});

  @override
  State<WalletsScreen> createState() => _WalletsScreenState();
}

class _WalletsScreenState extends State<WalletsScreen> {
  int currentIndex = 0;
  List<String> creditCard = [
    "assets/images/cart_1.jpg",
    "assets/images/cart_2.png"
  ];
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
            "My Wallets",
            style: Theme.of(context).textTheme.headline6,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
                size: 28,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(defaultPadding),
            physics: BouncingScrollPhysics(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 200,
                width: double.infinity,
                child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index % creditCard.length;
                      });
                    },
                    itemCount: creditCard.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Image.asset(
                          creditCard[index % creditCard.length],
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < creditCard.length; i++)
                    buildIndicator(currentIndex == i)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Recents Transactions",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                          itemCount: demo_transactions.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                            padding:
                                const EdgeInsets.only(right: defaultPadding),
                            child: TransactionItemCard(
                              title: demo_transactions[index].title,
                              image: demo_transactions[index].image,
                              price: demo_transactions[index].price,
                              bgColor: demo_transactions[index].bgColor,
                              date: demo_transactions[index].date,
                            ),
                          ),
                        )),
                  ]))
            ])));
  }

  Widget buildIndicator(bool isSelected) {
    return Container(
      height: isSelected ? 12 : 8,
      width: isSelected ? 12 : 8,
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? primaryColor.withOpacity(0.5) : Colors.grey),
    );
  }
}

class TransactionItemCard extends StatefulWidget {
  const TransactionItemCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.date,
    required this.bgColor,
  }) : super(key: key);
  final String image, title;
  final String date;
  final int price;
  final Color bgColor;

  @override
  State<TransactionItemCard> createState() => _TransactionItemCardState();
}

class _TransactionItemCardState extends State<TransactionItemCard> {
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
                widget.date.toString(),
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Expanded(child: Container()),
          Container(
            child: Text(
              "\$" + widget.price.toString(),
              style: TextStyle(color: primaryColor, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
