import 'package:flutter/material.dart';
import 'package:liviz_shop/models/Product.dart';
import 'package:liviz_shop/models/favouriteProduct.dart';
import 'package:liviz_shop/screens/details/details_screen.dart';
import 'package:liviz_shop/constants.dart';
import 'package:liviz_shop/screens/favorite/components/favouriteProductCard.dart';

class FavouriteProductsList extends StatelessWidget {
  const FavouriteProductsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: GridView.builder(
              physics: BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: defaultPadding,
                  mainAxisSpacing: defaultPadding,
                  childAspectRatio: 0.72),
              itemCount: demo_favorite_product.length,
              itemBuilder: (context, index) => FavouriteProductCard(
                    title: demo_favorite_product[index].title,
                    image: demo_favorite_product[index].image,
                    price: demo_favorite_product[index].price,
                    bgColor: demo_favorite_product[index].bgColor,
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                favouriteProduct: demo_favorite_product[index]),
                          ));
                    },
                  )),
        )
      ],
    );
  }
}
