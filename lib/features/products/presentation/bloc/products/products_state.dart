part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
}

class ProductsInitial extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsLoading extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsLoaded extends ProductsState {
  final Products products;

  ProductsLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class ProductsFailure extends ProductsState {
  final String message;

  ProductsFailure({required this.message});
  @override
  List<Object> get props => [message];
}
