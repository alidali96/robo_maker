import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../domain/entities/products.dart';
import '../../../domain/usecases/get_products.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProducts getProducts;

  ProductsBloc({required this.getProducts}) : super(ProductsInitial());
  @override
  Stream<ProductsState> mapEventToState(
    ProductsEvent event,
  ) async* {
    if (event is LoadProducts) {
      yield ProductsLoading();
      final result = await getProducts(NoParams());
      yield result.fold(
        (failure) => ProductsFailure(message: failure.message),
        (products) => ProductsLoaded(products),
      );
    }
  }
}
