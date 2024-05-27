// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/data/model/product_model.dart';
import 'package:equatable/equatable.dart';

sealed class ProductState extends Equatable {}

class ProductInitialState extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoadState extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductErrorState extends ProductState {
  final String errorMessage;

  ProductErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class ProductSuccessState extends ProductState {
  final List<ProductModel> products;
  ProductSuccessState({
    required this.products,
  });

  @override
  List<Object?> get props => products;
}
