import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/product.dart';
import '../../../domain/usecases/get_product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProduct getProduct;

  ProductBloc({required this.getProduct}) : super(ProductInitial());
  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is LoadProduct) {
      yield ProductLoading();
      final result = await getProduct(Params(id: event.id));
      yield result.fold(
        (failure) => ProductFailure(message: failure.message),
        (product) => ProductLoaded(product),
      );
    }
  }
}
