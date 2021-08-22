import 'package:clementoni/core/presentation/pages/error_page.dart';
import 'package:clementoni/core/presentation/widgets/loading_indicator.dart';
import 'package:clementoni/features/products/presentation/bloc/product/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/app_bar.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/product.dart';

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
      appBar: MyAppBar(title: product.name),
      body: BlocProvider(
        create: (_) => getIt<ProductBloc>(),
        child: Container(
          child:
              BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
            if (state is ProductInitial) {
              _loadProduct(context, id: product.id);
            } else if (state is ProductLoading) {
              return LoadingIndicator();
            } else if (state is ProductLoaded) {
              return _buildProductPage(context, product: state.product);
            } else if (state is ProductFailure) {
              return ErrorPage(text: state.message);
            }

            return Container();
          }),
        ),
      ),
    );
  }

  void _loadProduct(BuildContext context, {required int id}) {
    BlocProvider.of<ProductBloc>(context).add(LoadProduct(id: id));
  }

  Widget _buildProductPage(BuildContext context, {required Product product}) {
    return ListView(
      children: [
        Image.network(product.image),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            product.name,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        ...product.details.map(
          (detail) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Text(
              detail,
              style:
                  Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 20),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Add to Cart',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ],
    );
  }
}
