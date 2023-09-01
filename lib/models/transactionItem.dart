import 'package:flutter/material.dart';

class TransactionItem {
  final String image, title;
  final String date;
  final int price;
  final Color bgColor;

  TransactionItem({
    required this.image,
    required this.title,
    required this.price,
    required this.date,
    this.bgColor = const Color(0xFFEFEFF2),
  });
}

List<TransactionItem> demo_transactions = [
  TransactionItem(
    image: "assets/images/product_0.png",
    title: "Long Sleeve Shirts",
    price: 165,
    date: "23 Mars 2022",
    bgColor: const Color(0xFFFEFBF9),
  ),
  TransactionItem(
    image: "assets/images/product_0.png",
    title: "Long Sleeve Shirts",
    price: 165,
    date: "23 Mars 2022",
    bgColor: const Color(0xFFFEFBF9),
  ),
  TransactionItem(
    image: "assets/images/product_0.png",
    title: "Long Sleeve Shirts",
    price: 165,
    date: "23 Mars 2022",
    bgColor: const Color(0xFFFEFBF9),
  ),
];
