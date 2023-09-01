import 'package:flutter/material.dart';

class CartProduct {
  final String image, title;
  final int price;
  final int quantity;
  final Color bgColor;

  CartProduct({
    required this.image,
    required this.title,
    required this.price,
    required this.quantity,
    this.bgColor = const Color(0xFFEFEFF2),
  });
}

List<CartProduct> demo_cartproduct = [
  CartProduct(
    image: "assets/images/product_0.png",
    title: "Long Sleeve Shirts",
    price: 165,
    quantity: 1,
    bgColor: const Color(0xFFFEFBF9),
  ),
  CartProduct(
    image: "assets/images/product_1.png",
    title: "Casual Henley Shirts",
    price: 99,
    quantity: 2,
  ),
  CartProduct(
    image: "assets/images/product_2.png",
    title: "Curved Hem Shirts",
    price: 180,
    quantity: 1,
    bgColor: const Color(0xFFF8FEFB),
  ),
  CartProduct(
    image: "assets/images/product_3.png",
    title: "Casual Nolin",
    price: 149,
    quantity: 3,
    bgColor: const Color(0xFFEEEEED),
  ),
];
