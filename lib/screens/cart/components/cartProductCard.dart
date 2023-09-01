import 'package:flutter/material.dart';
import 'package:liviz_shop/constants.dart';

class MyCartProductCard extends StatefulWidget {
  const MyCartProductCard(
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
  State<MyCartProductCard> createState() => _MyCartProductCardState();
}

class _MyCartProductCardState extends State<MyCartProductCard> {
  @override
  int quantity = 0;

  void initState() {
    super.initState();
    setState(() {
      quantity = widget.quantity;
    });
  }

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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        quantity = quantity + 1;
                      });
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5)),
                      child: Icon(
                        Icons.add,
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    "${quantity}",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity = quantity - 1;
                        });
                      }
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5)),
                      child: Icon(
                        Icons.remove,
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
