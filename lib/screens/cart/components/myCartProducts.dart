import 'package:flutter/material.dart';
import 'package:liviz_shop/constants.dart';
import 'package:liviz_shop/models/Product.dart';
import 'package:liviz_shop/models/cartProduct.dart';
import 'package:liviz_shop/screens/cart/cartscreen.dart';
import 'package:liviz_shop/screens/checkoutScreen/checkOutScreen.dart';
import 'package:page_transition/page_transition.dart';

import 'cartProductCard.dart';

class cartProductsList extends StatelessWidget {
  const cartProductsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.65,
              child: ListView.builder(
                itemCount: demo_cartproduct.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: defaultPadding),
                  child: MyCartProductCard(
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
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Sous-total",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "2000 frs",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )
          ],
        ),
        const SizedBox(height: defaultPadding * 2),
        Center(
          child: SizedBox(
            width: 200,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeftJoined,
                        duration: Duration(milliseconds: 700),
                        childCurrent: MyCartScreen(),
                        reverseDuration: Duration(milliseconds: 700),
                        child: CheckOutScreen()));
              },
              style: ElevatedButton.styleFrom(
                  primary: primaryColor, shape: const StadiumBorder()),
              child: const Text("Checkout"),
            ),
          ),
        )
      ],
    );
  }
}
