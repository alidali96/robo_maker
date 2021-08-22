import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:clementoni/features/products/domain/entities/product.dart';
import 'package:clementoni/features/products/domain/usecases/get_product.dart';
import 'package:equatable/equatable.dart';
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
