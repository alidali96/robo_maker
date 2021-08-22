import 'package:clementoni/features/products/domain/entities/product.dart';
import 'package:clementoni/features/products/presentation/pages/product_page.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        ProductPage.route,
        arguments: product,
      ),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Text(
                            product.category,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                product.image,
                width: 125,
                height: 125,
                fit: BoxFit.contain,
              ),
            ),
            // Text(product.image),
          ],
        ),
      ),
    );
  }
}
