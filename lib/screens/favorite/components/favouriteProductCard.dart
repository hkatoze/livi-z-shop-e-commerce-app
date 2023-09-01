import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:liviz_shop/constants.dart';

class FavouriteProductCard extends StatelessWidget {
  const FavouriteProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.press,
    required this.bgColor,
  }) : super(key: key);
  final String image, title;
  final VoidCallback press;
  final int price;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 154,
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: const BorderRadius.all(
                    Radius.circular(defaultBorderRadius)),
              ),
              child: Stack(children: [
                Positioned(
                    left: 95,
                    top: -5,
                    child: IconButton(
                      onPressed: () {},
                      icon: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: SvgPicture.asset(
                          "assets/icons/Heart.svg",
                          height: 20,
                        ),
                      ),
                    )),
                Center(
                  child: Image.asset(
                    image,
                    height: 132,
                  ),
                )
              ]),
            ),
            const SizedBox(height: defaultPadding / 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(width: defaultPadding / 4),
                Text(
                  "\$" + price.toString(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
