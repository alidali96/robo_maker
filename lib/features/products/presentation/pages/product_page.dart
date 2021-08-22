import 'package:clementoni/core/presentation/widgets/app_bar.dart';
import 'package:clementoni/features/products/domain/entities/product.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  static const route = '/product';
  final Product product;
  const ProductPage({
    required this.product,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: Text(product.name),
      ),
    );
  }
}
