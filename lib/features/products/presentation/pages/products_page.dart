import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/pages/error_page.dart';
import '../../../../core/presentation/widgets/loading_indicator.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/products.dart';
import '../bloc/products/products_bloc.dart';
import '../widgets/product_tile.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProductsBloc>(),
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsInitial) {
            _loadProducts(context);
          } else if (state is ProductsLoading) {
            return LoadingIndicator();
          } else if (state is ProductsLoaded) {
            return _buildProductsList(context, products: state.products);
          } else if (state is ProductsFailure) {
            return ErrorPage(text: state.message);
          }

          return Container();
        },
      ),
    );
  }

  Widget _buildProductsList(
    BuildContext context, {
    required Products products,
  }) {
    return RefreshIndicator(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: products.list.length,
        itemBuilder: (context, index) {
          final product = products.list[index];
          return ProductTile(product: product);
        },
      ),
      onRefresh: () async => _loadProducts(context),
    );
  }

  void _loadProducts(BuildContext context) {
    BlocProvider.of<ProductsBloc>(context).add(LoadProducts());
  }
}
